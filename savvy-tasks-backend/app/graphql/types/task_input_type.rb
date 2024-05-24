# frozen_string_literal: true

module Types
  class TaskInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :title, String, required: false
    argument :description, String, required: false
    argument :completed, Boolean, required: false
    argument :due_date, GraphQL::Types::ISO8601DateTime, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
