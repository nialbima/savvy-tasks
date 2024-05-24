# frozen_string_literal: true

module Mutations
  class TaskDelete < BaseMutation
    description "Deletes a task by ID"

    field :task, Types::TaskType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      task = ::Task.find(id)
      task.destroy!

      if task.persisted?
        raise execution_error("Error deleting task", task)
      end

      {task: task}
    end
  end
end
