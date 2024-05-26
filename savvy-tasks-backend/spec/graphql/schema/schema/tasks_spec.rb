# frozen_string_literal: true

require "rails_helper"

RSpec.describe SavvyTasksBackendSchema, "tasks", type: :graphql do
  it "loads a single task by ID" do
    freeze_time

    query_string = <<-GRAPHQL
      query getTask($id: ID!){
        task(id: $id) {
          title
          description
          dueDate
          id
        }
      }
    GRAPHQL

    task = create :task, title: "FIND ME"
    task_id = described_class.id_from_object(task, Types::TaskType, {})
    result = described_class.execute(query_string, variables: {id: task_id})

    task_result = result["data"]["task"]
    expect(task_result).to eq({
      "description" => "WHAT EVEN IS THIS, MAN, OH GOOD WHAT NOW",
      "title" => "FIND ME",
      "id" => task.gid,
      "dueDate" => 4.days.from_now.iso8601
    })
  end

  it "loads a user by ID and hydrates tasks" do
    current_user = create :test_user
    freeze_time

    query_string = <<-GRAPHQL
      query HydrateUserData($id: ID!, $startCursor: String, $endCursor: String, $pageSize: Int) {
        user(id: $id) {
          id
          activeTasksCount
          tasks(first: $pageSize, after: $endCursor, before: $startCursor) {
            edges {
              cursor
              node {
                id
                title
                description
                dueDate
                completed
              }
            }
            pageInfo {
              hasNextPage
              hasPreviousPage
              startCursor
              endCursor
            }
          }
        }
      }
    GRAPHQL

    task = create :task, title: "FIND ME", user: current_user
    another_task = create :task, title: "FIND ME TOO", user: current_user

    expected_response_with_pagination = {
      "user" => a_hash_including(
        "activeTasksCount" => 2,
        "id" => current_user.gid,
        "tasks" => a_hash_including(
          "edges" => match_array(
            [
              {
                "cursor" => be_a(String),
                "node" => a_hash_including(
                  "description" => "WHAT EVEN IS THIS, MAN, OH GOOD WHAT NOW",
                  "title" => "FIND ME",
                  "id" => task.gid,
                  "dueDate" => 4.days.from_now.iso8601,
                  "completed" => false
                )
              }, {
                "cursor" => be_a(String),
                "node" => a_hash_including(
                  "description" => "WHAT EVEN IS THIS, MAN, OH GOOD WHAT NOW",
                  "title" => "FIND ME TOO",
                  "id" => another_task.gid,
                  "dueDate" => 4.days.from_now.iso8601,
                  "completed" => false
                )
              }
            ]
          ),
          "pageInfo" => a_hash_including(
            "hasNextPage" => false,
            "hasPreviousPage" => false,
            "startCursor" => "MQ",
            "endCursor" => "Mg"
          )
        )
      )
    }
    result = described_class.execute(query_string, variables: {id: current_user.gid})

    task_results = result["data"]
    expect(task_results).to include(expected_response_with_pagination)
  end

  it "correctly encodes the pagination cursors" do
    current_user = create :test_user
    freeze_time

    4.times do |n|
      create :task, title: "FIND ME#{n}", user: current_user
    end

    query_string = <<-GRAPHQL
      query HydrateUserData($id: ID!, $startCursor: String, $endCursor: String, $pageSize: Int) {
        user(id: $id) {
          id
          activeTasksCount
          tasks(first: $pageSize, after: $endCursor, before: $startCursor) {
            edges {
              cursor
              node {
                id
              }
            }
            pageInfo {
              hasNextPage
              hasPreviousPage
              startCursor
              endCursor
            }
          }
        }
      }
    GRAPHQL

    page_size = 2

    variables = graphql_query_variables(id: current_user.gid, page_size: page_size)

    first_page_result = described_class.execute(query_string, variables: variables)
    first_page_info = first_page_result.dig("data", "user", "tasks", "pageInfo")
    first_page_start_cursor = first_page_info.fetch("startCursor")
    first_page_end_cursor = first_page_info.fetch("endCursor")

    variables[:end_cursor] = first_page_end_cursor
    variables = graphql_query_variables(**variables)

    second_page_result = described_class.execute(query_string, variables: variables)
    second_page_info = second_page_result.dig("data", "user", "tasks", "pageInfo")
    second_page_start_cursor = second_page_info.fetch("startCursor")
    second_page_end_cursor = second_page_info.fetch("endCursor")

    expect(
      [first_page_start_cursor, first_page_end_cursor, second_page_start_cursor, second_page_end_cursor]
    ).to eq(
      ["MQ", "Mg", "Mw", "NA"]
    )
  end
end
