# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'

if ::RUBY_VERSION[/\A2\.5.+\z/]
  require 'simplecov'

  SimpleCov.minimum_coverage(100)
  SimpleCov.start { add_filter(%r{\A/spec/}) }
end

require 'faker'
require 'pry'
require 'truemail'
require 'truemail/rspec'

RSpec.configure do |config|
  config.include Truemail::RSpec
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
