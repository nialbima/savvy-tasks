# frozen_string_literal: true

module Types
  class TaskType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    field :title, String, null: false
    field :description, String
    field :completed, Boolean, null: false
    field :due_date, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :discarded_at, GraphQL::Types::ISO8601DateTime, null: false

    field :create_task, mutation: Mutations::Tasks::CreateTask
    field :delete_task, mutation: Mutations::Tasks::DeleteTask
    field :update_task, mutation: Mutations::Tasks::UpdateTask
  end
end
