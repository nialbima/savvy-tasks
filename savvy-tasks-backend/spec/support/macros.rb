# frozen_string_literal: true

module Macros
  # This is a pattern I worked out for managing macro state when an app gets complex.
  def load_all(rspec_config_object)
    load_graphql_macros(rspec_config_object)
  end

  module_function :load_all

  def load_graphql_macros(rspec_config_object)
    [GraphQL].each do |macro|
      rspec_config_object.include(macro, type: :graphql)
    end
  end

  module_function :load_graphql_macros
end
