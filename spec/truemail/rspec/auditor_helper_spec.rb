# frozen_string_literal: true

RSpec.describe Truemail::RSpec::AuditorHelper, type: :helper do
  describe '#create_auditor' do
    let(:auditor_instance_result) { auditor_instance.result }
    let(:auditor_instance_result_configuration) { auditor_instance_result.configuration }

    describe 'auditor instance without warnings' do
      context 'when params not passed' do
        subject(:auditor_instance) { create_auditor }

        it 'creates successful auditor instance' do
          expect(auditor_instance_result.warnings).to be_empty
          expect(auditor_instance_result_configuration).to be_an_instance_of(Truemail::Configuration)
        end
      end

      context 'when params passed' do
        subject(:auditor_instance) { create_auditor(success: success_status, current_host_ip: current_host_ip) }

        let(:success_status) { true }
        let(:current_host_ip) { FFaker::Internet.ip_v4_address }

        it 'creates successful auditor instance' do
          expect(auditor_instance_result.current_host_ip).to eq(current_host_ip)
          expect(auditor_instance_result.warnings).to be_empty
          expect(auditor_instance_result_configuration).to be_an_instance_of(Truemail::Configuration)
        end
      end
    end

    describe 'auditor instance with warnings' do
      context 'with default warnings' do
        subject(:auditor_instance) { create_auditor(success: false) }

        it 'creates auditor instance with warnings' do
          expect(auditor_instance_result.current_host_ip).to be_nil
          expect(auditor_instance_result.warnings).to eq(ip: Truemail::Audit::Ip::IPIFY_ERROR)
          expect(auditor_instance_result_configuration).to be_an_instance_of(Truemail::Configuration)
        end
      end

      context 'with custom warnings' do
        subject(:auditor_instance) { create_auditor(success: false, warnings: warnings) }

        let(:warnings) { { custom_warning: 'custom_warning_context' } }

        it 'creates auditor instance with warnings' do
          expect(auditor_instance_result.current_host_ip).to be_nil
          expect(auditor_instance_result.warnings).to eq(warnings)
          expect(auditor_instance_result_configuration).to be_an_instance_of(Truemail::Configuration)
        end
      end
    end
  end
end
