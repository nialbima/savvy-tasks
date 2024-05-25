require "rails_helper"

RSpec.describe Mutations::Tasks::DeleteTask, type: :request do
  it "soft-deletes a task" do
    task = create :task, title: "I'm in danger!"

    query_string = <<-GRAPHQL
      mutation DeleteTask($input: DeleteTaskInput!) {
        deleteTask(input: $input)
      }
    GRAPHQL

    update_params = {
      query: query_string,
      variables: {
        input: {
          id: task.to_gid_param,
        }
      }
    }
    expect do
      post graphql_path, params: update_params
    end.to change(Task, :count).by(0)

    task = Task.last
    expect(task).to be_discarded

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
