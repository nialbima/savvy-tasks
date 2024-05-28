# frozen_string_literal: true

module Types
  class TaskInputType < Types::BaseInputObject
    # Given more time, I think it'd be preferable to split these inputs off for each CRUD operation.
    with_options required: false do
      # These are removed from the attributes passed to SQL when they're present in the payload.
      argument :__typename, String
      argument :gid, String

      argument :title, String
      argument :description, String
      argument :completed, Boolean
      argument :due_date, GraphQL::Types::ISO8601DateTime
      argument :discarded_at, GraphQL::Types::ISO8601DateTime
    end
  end
end
