# This file is copied to spec/ when you run 'rails generate rspec:install'
require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"

Rails.root.glob("spec/support/**/*.rb").sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # We do this as early as we can, so that RSpec always knows which macros must be available to which type of spec.
  Macros.load_all(config)

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_paths = [
    Rails.root.join("spec/fixtures")
  ]
  config.use_transactional_fixtures = true

  # I like using explicit types for my specs so that they stay organized, so I'm disabling this.
  # config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  # config.filter_gems_from_backtrace("gem name")
end
