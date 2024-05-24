# frozen_string_literal: true

module Loaders
  class Task < GraphQL::Batch::Loader
    # Define `initialize` to store grouping arguments, eg
    #
    #     Loaders::Task.for(group).load(value)
    #
    # def initialize()
    # end

    # `keys` contains each key from `.load(key)`.
    # Find the corresponding values, then
    # call `fulfill(key, value)` or `fulfill(key, nil)`
    # for each key.
    def perform(keys)
    end
  end
end
