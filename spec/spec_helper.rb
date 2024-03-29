# frozen_string_literal: true

require 'bundler/setup'

if ::RUBY_VERSION[/\A3\.3.+\z/]
  require 'pry'
  require 'simplecov'

  SimpleCov.minimum_coverage(100)
  SimpleCov.start { add_filter(%r{\A/spec/}) }
end

require 'ffaker'
require 'pry'
require 'truemail'
require 'truemail/rspec'

RSpec.configure do |config|
  config.include Truemail::RSpec
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
