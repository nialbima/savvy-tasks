# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :task_delete, mutation: Mutations::TaskDelete
    field :task_update, mutation: Mutations::TaskUpdate
    field :task_create, mutation: Mutations::TaskCreate
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
