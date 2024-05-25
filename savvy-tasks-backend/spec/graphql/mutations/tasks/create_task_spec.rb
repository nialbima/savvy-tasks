require "rails_helper"

RSpec.describe Mutations::Tasks::CreateTask, type: :request do
  it "creates a task" do
    query_string = <<-GRAPHQL
      mutation {
        createTask(
          input: {
            taskInput: {
              title: "What A Good Title"
            }
          }
        ) {
          task {
            id
            title
          }
        }
      }
    GRAPHQL

    expect {
      post graphql_path, params: {query: query_string}
    }.to change(Task, :count).by(1)

    task = Task.last
    json_response = JSON.parse(response.body)
    expect(response).to have_http_status(:ok)
    expect(json_response).to eq(
      "data" => {
        "createTask" => {
          "task" => {
            "id" => task.to_gid_param,
            "title" => "What A Good Title"
          }
        }
      }
    )
  end
end
