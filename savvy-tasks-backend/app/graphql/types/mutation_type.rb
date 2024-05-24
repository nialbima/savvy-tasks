# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :task_delete, mutation: Mutations::TaskDelete
    field :task_update, mutation: Mutations::TaskUpdate
    field :task_create, mutation: Mutations::TaskCreate
  end
end
