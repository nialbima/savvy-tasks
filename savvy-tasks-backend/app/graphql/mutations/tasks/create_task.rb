# frozen_string_literal: true

module Mutations
  module Tasks
    class CreateTask < BaseMutation
      description "Creates a new task"

      field :task, Types::TaskType, null: false

      argument :task_input, Types::TaskInputType, required: true

      def resolve(task_input:)
        task = ::Task.new(**task_input)

        unless task.save
          raise GraphQL::ExecutionError.new "Error creating task", extensions: task.errors.to_hash
        end

        {task: task}
      end
    end
  end
end
