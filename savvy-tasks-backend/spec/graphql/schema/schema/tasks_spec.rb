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

    debugger
    task_result = result["data"]["task"]
    # TODO: this shouldn't be an int ID.
    assert_equal task_id, task_result["id"]
    assert_equal "FIND ME", task_result["title"]
  end
end
