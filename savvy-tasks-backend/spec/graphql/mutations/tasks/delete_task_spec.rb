# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::Tasks::DeleteTask, type: :request do
  it "soft-deletes a task" do
    task = create :task, title: "I'm in danger!"

    freeze_time

    query_string = <<-GRAPHQL
      mutation DeleteTask($input: DeleteTaskInput!) {
        deleteTask(input: $input) {
          task {
            id
            discardedAt
          }
        }
      }
    GRAPHQL

    update_params = {query: query_string, variables: {input: {id: task.to_gid_param}}}

    expected_response = {
      "data" => {
        "deleteTask" => {
          "task" => {
            "id" => task.to_gid_param,
            "discardedAt" => Time.zone.now.iso8601
          }
        }
      }
    }

    post graphql_path, params: update_params

    task = Task.last
    json_response = JSON.parse(response.body)

    expect(task).to be_discarded
    expect(response).to have_http_status(:ok)
    expect(json_response).to eq(expected_response)
  end

  it "raises an error when a discarded task is scheduled for soft-deletion" do
    task = create :task, title: "I'm in danger!"
    freeze_time

    task.discard!

    query_string = <<-GRAPHQL
      mutation DeleteTask($input: DeleteTaskInput!) {
        deleteTask(input: $input) {
          task {
            id
            discardedAt
          }
        }
      }
    GRAPHQL

    expected_response = {
      "data" => {"deleteTask" => nil},
      "errors" => [
        {
          "extensions" => {},
          "locations" => [{"column" => 9, "line" => 2}],
          "message" => "Error deleting task",
          "path" => ["deleteTask"]
        }
      ]
    }

    update_params = {query: query_string, variables: {input: {id: task.to_gid_param}}}
    post graphql_path, params: update_params

    task = Task.last
    json_response = JSON.parse(response.body)

    expect(task).to be_discarded
    expect(response).to have_http_status(:ok)
    expect(json_response).to eq(expected_response)
  end
end
