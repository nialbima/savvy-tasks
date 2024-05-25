# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def execution_error(message, record)
      binding.break
      GraphQL::ExecutionError.new message, extensions: record.errors.to_hash
    end
  end
end
