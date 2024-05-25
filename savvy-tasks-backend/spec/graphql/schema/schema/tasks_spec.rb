require "rails_helper"

RSpec.describe SavvyTasksBackendSchema, "tasks", type: :graphql do
  it "loads tasks by ID" do
    query_string = <<-GRAPHQL
      query getTask($id: ID!){
        task(id: $id) {
          title
          id
        }
      }
    GRAPHQL

    task = create :task, title: "FIND ME"
    task_id = described_class.id_from_object(task, Types::TaskType, {})
    result = described_class.execute(query_string, variables: {id: task_id})

    task_result = result["data"]["task"]
    # TODO: this shouldn't be an int ID.
    expect(task_id).to eq task_result["id"]
    expect(task_id).not_to eq task.id
    assert_equal "FIND ME", task_result["title"]
  end
end
