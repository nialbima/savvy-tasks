# frozen_string_literal: true

class SavvyTasksBackendSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  use GraphQL::Dataloader

  disable_type_introspection_entry_point

  # Limit the size of incoming queries:
  max_query_string_tokens(5000)
  # Stop validating when it encounters this many errors:
  validate_max_errors(100)

  def self.resolve_type(abstract_type, obj, ctx)
    raise(GraphQL::RequiredImplementationMissingError)
  end

  def self.id_from_object(object, type_definition, query_ctx)
    # NOTE: as long as logins are implemented securely and tasks are scoped to a user ID,
    # it shouldn't be possible to enumerate over the DB and get access to invalid items.
    GidManager.get_gid(object: object)
  end

  def self.object_from_id(global_id, query_ctx)
    GidManager.get_object(global_id: global_id)
  end
end
