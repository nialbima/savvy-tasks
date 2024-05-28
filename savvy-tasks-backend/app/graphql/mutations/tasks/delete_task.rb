# frozen_string_literal: true

module Mutations
  module Tasks
    class DeleteTask < BaseMutation
      description "Deletes a task by ID"

      field :gid, ID
      field :discarded_at, GraphQL::Types::ISO8601DateTime
      field :task, Types::TaskType

      argument :gid, ID, required: true

      def resolve(gid:)
        task = ::GidManager.get_object(global_id: gid)

        begin
          task.discard!
        rescue Discard::RecordNotDiscarded
          raise execution_error("Error deleting task", task)
        end

        {task: task}
      end
    end
  end
end
