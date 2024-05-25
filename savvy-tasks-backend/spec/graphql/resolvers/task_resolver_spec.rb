require "rails_helper"

RSpec.describe Resolvers::TaskResolver, type: :graphql do
  it "fetches a task by ID" do
    task = create(:task, :randomized)
    query = described_class.new(**empty_resolver_args)
    result = query.resolve(id: task.id)
    expect(result).to eq(task)
  end
end
