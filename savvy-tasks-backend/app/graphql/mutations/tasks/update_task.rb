# frozen_string_literal: true

module Mutations
  module Tasks
    class UpdateTask < BaseMutation
      description "Updates a task by id"

      field :task, Types::TaskType, null: false

      argument :task_input, Types::TaskInputType, required: true

      def resolve(task_input:)
        task = ::GidManager.get_object(global_id: task_input.id)

        unless task.update(**task_input)
          raise GraphQL::ExecutionError.new "Error updating task", extensions: task.errors.to_hash
        end

        {task: task}
      end
    end
  end
end
