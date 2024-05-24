# frozen_string_literal: true

module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String
    field :completed, Boolean, null: false
    field :due_date, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
