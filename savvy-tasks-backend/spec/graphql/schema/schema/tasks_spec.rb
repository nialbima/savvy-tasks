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
    freeze_time

    query_string = <<-GRAPHQL
      query ListTasks($ids: [ID!]!) {
        tasks(ids: $ids) {
          title
          description
          dueDate
          id
        }
      }
    GRAPHQL

    task = create :task, title: "FIND ME"
    another_task = create :task, title: "FIND ME TOO"
    task_ids = [task, another_task].map(&:gid)
    result = described_class.execute(query_string, variables: {ids: task_ids})

    task_results = result["data"]
    expect(task_results).to include(
      "tasks" => match_array([
        {
          "description" => "WHAT EVEN IS THIS, MAN, OH GOOD WHAT NOW",
          "title" => "FIND ME",
          "id" => task.gid,
          "dueDate" => 4.days.from_now.iso8601
        }, {
          "description" => "WHAT EVEN IS THIS, MAN, OH GOOD WHAT NOW",
          "title" => "FIND ME TOO",
          "id" => another_task.gid,
          "dueDate" => 4.days.from_now.iso8601
        }
      ])
    )
  end
end
