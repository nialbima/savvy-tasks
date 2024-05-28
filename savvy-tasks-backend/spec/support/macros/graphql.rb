# frozen_string_literal: true

module Macros
  module GraphQL
    # This is a little bit of overkill for this example, but it's a good pattern to follow when you need to encapsulate
    # shared behavior for specific functionality. It's mostly equivalent to helpers, but I like having a defined module
    # I can use to keep things organized, and it's a little more explicit. Having to hunt down references to rando
    # methods in a spec file is a pain.

    def empty_graphql_args
      {object: nil, context: nil, field: nil}
    end

    def graphql_query_variables(**kwargs)
      kwargs.transform_keys { |k| k.to_s.camelize(:lower) }
    end
  end
end
