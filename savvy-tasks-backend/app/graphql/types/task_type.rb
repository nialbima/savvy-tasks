# frozen_string_literal: true

module Types
  class TaskType < Types::BaseObject
    delegate :gid, to: :object

    field :gid, ID, description: "GID of the object."

    field :title, String, null: false
    field :description, String
    field :completed, Boolean, null: false
    field :due_date, GraphQL::Types::ISO8601DateTime
    field :discarded_at, GraphQL::Types::ISO8601DateTime

    field :create_task, mutation: Mutations::Tasks::CreateTask
    field :delete_task, mutation: Mutations::Tasks::DeleteTask
    field :update_task, mutation: Mutations::Tasks::UpdateTask

    field :user, UserType, null: true
  end
end
