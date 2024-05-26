# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    field :username, String
    field :email, String

    field :tasks, TaskType.connection_type, null: false
    field :active_tasks_count, Integer, null: false

    def tasks
      object.tasks.kept.order(created_at: :asc)
    end

    def active_tasks_count
      tasks.size
    end
  end
end
