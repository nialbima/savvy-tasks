# frozen_string_literal: true

module Mutations
  module Tasks
    class DeleteTask < BaseMutation
      description "Deletes a task by ID"

      field :task, Types::TaskType, null: false

      argument :task_input, Types::TaskInputType, required: true

      def resolve(task_input:)
        task = ::GidManager.get_object(global_id: task_input.gid)

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
