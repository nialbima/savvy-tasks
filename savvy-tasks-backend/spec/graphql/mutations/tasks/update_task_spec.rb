# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::Tasks::CreateTask, type: :request do
  it "updates a task" do
    _current_user = create :test_user
    task = create :task, title: "What A Good Title"

    query_string = <<-GRAPHQL
      mutation UpdateTask($input: UpdateTaskInput!) {
        updateTask(input: $input) {
          task {
            id
            title
          }
        }
      }
    GRAPHQL

    update_params = {
      query: query_string,
      variables: {
        input: {
          id: task.to_gid_param,
          taskInput: {
            title: "Another Good Title"
          }
        }
      }
    }
    expect do
      post graphql_path, params: update_params
    end.to change(Task, :count).by(0)

    task = Task.last
    json_response = JSON.parse(response.body)

    expect(response).to have_http_status(:ok)
    expect(json_response).to eq(
      "data" => {
        "updateTask" => {
          "task" => {
            "id" => task.to_gid_param,
            "title" => "Another Good Title"
          }
        }
      }
    )
  end
end
