require "rails_helper"

RSpec.describe Mutations::BaseMutation, type: :graphql do
  specify(:aggregate_failures) do
    expect(described_class.argument_class).to eq Types::BaseArgument
  end

  describe "#execution_error" do
    # TODO: Should this go in the base class? Seems like this is used everywhere
    it "returns a GraphQl execution error with a standardized format" do
      instance = described_class.new(**empty_graphql_args)
      task = build :task
      task.valid?
      error = instance.execution_error("YOU DID IT WRONG", task)
      expect(error).to be_a(GraphQL::Execution)
      expect(error.to_h).to eq(
        {"message"=>"YOU DID IT WRONG", "extensions"=>{"title"=>["can't be blank"], "completed"=>["can't be blank"]}}
      )
    end
  end
end
