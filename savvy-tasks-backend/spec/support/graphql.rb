RSpec.configure do |config|
  with_options type: :graphql do
    config.include GraphQL::Testing::Helpers.for(SavvyTasksBackendSchema)
  end
end
