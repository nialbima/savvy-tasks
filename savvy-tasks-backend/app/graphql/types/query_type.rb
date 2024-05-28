# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :gid, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of GIDs." do
      argument :gids, [ID], required: true, description: "GIDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    field :user, UserType, null: true do
      argument :gid, ID, required: true
    end

    field :task, TaskType, null: true do
      argument :gid, ID, required: true
    end

    def task(gid:) = default_query(gid: gid)

    def user(gid:) = default_query(gid: gid)

    def default_query(gid:)
      context.schema.object_from_id(gid, context)
    end
  end
end
