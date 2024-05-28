# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    delegate :gid, to: :object

    field :gid, ID, description: "GlobalID of the object."

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
