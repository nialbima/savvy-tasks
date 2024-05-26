# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :user, UserType, null: true do
      argument :id, ID, required: true
    end

    field :task, TaskType, null: true do
      argument :id, ID, required: true
    end

    def task(id:) = default_query(id: id)

    def user(id:) = default_query(id: id)

    def default_query(id:)
      context.schema.object_from_id(id, context)
    end
  end
end
