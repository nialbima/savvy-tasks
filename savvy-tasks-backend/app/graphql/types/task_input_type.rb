# frozen_string_literal: true

module Types
  class TaskInputType < Types::BaseInputObject
    # This SHOULD be required for update and NOT required for create.
    argument :id, ID, required: false
    argument :title, String, required: false
    argument :description, String, required: false
    argument :completed, Boolean, required: false
    argument :due_date, GraphQL::Types::ISO8601DateTime, required: false
    argument :discarded_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
