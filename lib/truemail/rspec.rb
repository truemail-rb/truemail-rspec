# frozen_string_literal: true

require 'truemail/rspec/version'
require 'truemail/rspec/configuration_helper'
require 'truemail/rspec/validator_helper'

module Truemail
  module RSpec
    include Truemail::RSpec::ConfigurationHelper
    include Truemail::RSpec::ValidatorHelper
  end
end
