RSpec.describe SavvyTasksBackendSchema, "tasks", type: :graphql do
  it "loads tasks by ID" do
    query_string = <<-GRAPHQL
      query($id: ID!){
        node(id: $id) {
          ... on Post {
            title
            id
          }
        }
      }
    GRAPHQL

    task = create :task, title: "FIND ME"
    task_id = described_class.id_from_object(task, Types::Task, {})
    result = described_class.execute(query_string, variables: {id: task_id})

    task_result = result["data"]["node"]
    assert_equal tasjk_id, tasjk_result["id"]
    assert_equal "My Cool Thoughts", tasjk_result["title"]
  end
end
