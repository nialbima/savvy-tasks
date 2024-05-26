# frozen_string_literal: true

require "rails_helper"

RSpec.describe SavvyTasksBackendSchema, type: :graphql do
  it "is up to date" do
    current_file = Rails.root.join("app/graphql/schema.graphql").read
    current_definition = SavvyTasksBackendSchema.to_definition
    expect(current_file).to eq(current_definition)
  end
end
