# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'
require 'ffaker'
require 'pry'
require 'truemail'
require 'truemail/rspec'

SimpleCov.start

rspec_custom = File.join(File.dirname(__FILE__), 'support/**/*.rb')
Dir[File.expand_path(rspec_custom)].each do |file|
  require file unless file[/\A.+_spec\.rb\z/]
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
