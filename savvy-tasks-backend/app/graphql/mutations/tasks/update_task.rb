# frozen_string_literal: true

module Mutations
  module Tasks
    class UpdateTask < BaseMutation
      description "Updates a task by id"

      field :task, Types::TaskType, null: false

      argument :task_input, Types::TaskInputType, required: true

      def resolve(task_input:)
        task = ::GidManager.get_object(global_id: task_input.gid)
        # It'd be better to do this using the Rails attributes API, but the added complexity doesn't seem worthwhile for
        # this test.
        update_args = task_input.to_h.except(:gid)
        unless task.update(**update_args)
          raise execution_error("Error updating task", task)
        end

        {task: task}
      end

      def update_args(task_input:, task_id:)
        task_input.to_h.delete("gid").merge("id" => task_id)
      end
    end
  end
end
