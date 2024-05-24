# frozen_string_literal: true

module Mutations
  class TaskUpdate < BaseMutation
    description "Updates a task by id"

    field :task, Types::TaskType, null: false

    argument :id, ID, required: true
    argument :task_input, Types::TaskInputType, required: true

    def resolve(id:, task_input:)
      task = ::Task.find(id)
      unless task.update(**task_input)
        raise GraphQL::ExecutionError.new"Error updating task", extensions: task.errors.to_hash
      end

      {task: task}
    end
  end
end
