# frozen_string_literal: true

module Truemail
  module RSpec
    module AuditorHelper
      def create_auditor(
        success: true,
        current_host_ip: FFaker::Internet.ip_v4_address,
        warnings: { ip: Truemail::Audit::Ip::IPIFY_ERROR },
        configuration: create_configuration
      )
        Truemail::Auditor.new(configuration: configuration).tap do |auditor|
          auditor_result = auditor.result
          auditor_result.current_host_ip = current_host_ip if success
          auditor_result.warnings = warnings unless success
        end
      end
    end
  end
end
