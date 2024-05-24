require "simplecov"
require "simplecov-lcov"

SimpleCov.profiles.define "savvy-tasks" do
  load_profile "test_frameworks"

  enable_coverage :branch
  primary_coverage :branch

  SimpleCov::Formatter::LcovFormatter.config do |c|
    c.report_with_single_file = true
    c.output_directory = "coverage"
    c.lcov_file_name = "lcov.info"
  end

  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::LcovFormatter,
    SimpleCov::Formatter::HTMLFormatter
  ])
end

SimpleCov.start "savvy-tasks" if ENV["COVERAGE"] || ENV["CI"]
