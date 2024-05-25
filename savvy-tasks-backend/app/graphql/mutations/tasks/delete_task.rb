# frozen_string_literal: true

module Mutations
  module Tasks
    class DeleteTask < BaseMutation
      description "Deletes a task by ID"

      field :task, Types::TaskType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        task = ::GidManager.get_object(global_id: id)
        task.discard!

        if task.undiscarded?
          raise execution_error("Error deleting task", task)
        end

        {task: task}
      end
    end
  end
end
