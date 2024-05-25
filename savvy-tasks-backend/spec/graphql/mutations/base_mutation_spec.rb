require "rails_helper"

RSpec.describe Mutations::BaseMutation, type: :graphql do
  specify(:aggregate_failures) do
    expect(described_class.argument_class).to eq Types::BaseArgument
    expect(described_class.field_class).to eq Types::BaseField
    expect(described_class.input_object_class).to eq Types::BaseInputObject
    expect(described_class.object_class).to eq Types::BaseObject
  end

  describe "#execution_error" do
    it "returns a GraphQl execution error with a standardized format" do
      task = build :task, title: nil, completed: nil
      task.valid?

      instance = described_class.new(**empty_graphql_args)
      error = instance.execution_error("YOU DID IT WRONG", task)

      expect(error).to be_a(GraphQL::ExecutionError)
      expect(error.to_h).to eq(
        {
          "message" => "YOU DID IT WRONG",
          "extensions" => {"title" => ["can't be blank"], "completed" => ["must be defined"]}
        }
      )
    end
  end
end
