module Resolvers
  class TaskResolver < BaseResolver

    type Types::TaskType, null: false
    argument :id, ID

    def resolve(id:)
      context.schema.object_from_id(id, context)
    end
  end
end
