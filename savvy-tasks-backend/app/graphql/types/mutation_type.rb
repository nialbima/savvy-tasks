# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # NOTE: these should probably have their own folder.
    field :delete_task, mutation: Mutations::Tasks::DeleteTask
    field :update_task, mutation: Mutations::Tasks::UpdateTask
    field :create_task, mutation: Mutations::Tasks::CreateTask
  end
end
