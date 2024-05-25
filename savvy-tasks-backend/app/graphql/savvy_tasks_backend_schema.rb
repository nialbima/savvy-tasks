# frozen_string_literal: true

class SavvyTasksBackendSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  use GraphQL::Dataloader

  # Limit the size of incoming queries:
  max_query_string_tokens(5000)
  # Stop validating when it encounters this many errors:
  validate_max_errors(100)

  def self.type_error(err, context)
    # if err.is_a?(GraphQL::InvalidNullError)
    #   # report to your bug tracker here
    #   return nil
    # end
    super
  end

  def self.resolve_type(abstract_type, obj, ctx)
    raise(GraphQL::RequiredImplementationMissingError)
  end

  def self.id_from_object(object, type_definition, query_ctx)
    # NOTE: this probably isn't secure enough, but as long as logins are implemented securely,
    # it shouldn't be possible to enumerate over the DB and get access to invalid items.
    GidManager.get_gid(object: object)
  end

  def self.object_from_id(global_id, query_ctx)
    GidManager.get_object(global_id: global_id)
  end
end
