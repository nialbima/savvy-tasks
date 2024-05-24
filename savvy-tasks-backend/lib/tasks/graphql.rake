# As suggested by the GraphQL docs, code is from here: https://rmosolgo.github.io/ruby/graphql/2017/03/16/tracking-schema-changes-with-graphql-ruby
namespace :graphql do
  task dump_schema: :environment do
    schema_defn = SavvyTasksBackendSchema.to_definition
    schema_path = "app/graphql/schema.graphql"
    File.write(Rails.root.join(schema_path), schema_defn)
    puts "Updated #{schema_path}"
  end
end
