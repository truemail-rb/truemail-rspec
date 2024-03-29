# frozen_string_literal: true

RSpec.describe Truemail::RSpec::ValidatorHelper, type: :helper do
  describe 'defined constants' do
    it { expect(described_class).to be_const_defined(:VALIDATION_LIST_TYPE_REGEX_PATTERN) }
  end

  describe '#create_servers_list' do
    context 'without size' do
      subject(:servers_list) { create_servers_list }

      it 'returns random size array with ips' do
        expect(servers_list).to be_an_instance_of(::Array)
        expect(servers_list).not_to be_empty
      end
    end

    context 'with size' do
      subject(:servers_list) { create_servers_list(size) }

      let(:size) { 2 }

      it 'returns predefined size array with ips' do
        expect(servers_list).to be_an_instance_of(::Array)
        expect(servers_list.size).to eq(size)
      end
    end
  end

  describe '#create_validator' do
    subject(:validator_instance) do
      create_validator(validation_type, email, mx_servers, **kwargs)
    end

    let(:email) { ::FFaker::Internet.email }
    let(:mx_servers) { create_servers_list }
    let(:kwargs) { { success: success_status } }

    describe 'successful validator instance' do
      let(:validator_instance_result) { validator_instance.result }
      let(:validator_instance_result_configuration) { validator_instance_result.configuration }
      let(:success_status) { true }
      let(:expected_vlidation_type) { validation_type }

      shared_examples 'successful validator instance' do
        it 'creates successful validator instance' do
          expect(validator_instance_result.success).to be(success_status)
          expect(validator_instance_result.email).to eq(email)
          expect(validator_instance_result.errors).to be_empty
          expect(validator_instance_result.smtp_debug).to be_nil
          expect(validator_instance_result_configuration).to be_an_instance_of(Truemail::Configuration)
          expect(validator_instance.validation_type).to eq(expected_vlidation_type)
        end
      end

      context 'with list match validation type' do
        let(:expected_vlidation_type) { :whitelist }

        context 'with emails list validation type' do
          let(:validation_type) { :emails_list }

          include_examples 'successful validator instance'

          it 'has necessary validator instance result attributes' do
            expect(validator_instance_result.domain).to be_nil
            expect(validator_instance_result.mail_servers).to be_empty
            expect(validator_instance_result_configuration.whitelisted_emails).not_to be_empty
          end
        end

        context 'with domains list validation type' do
          let(:validation_type) { :domains_list }

          include_examples 'successful validator instance'

          it 'has necessary validator instance result attributes' do
            expect(validator_instance_result.domain).not_to be_nil
            expect(validator_instance_result.mail_servers).to be_empty
            expect(validator_instance_result_configuration.whitelisted_domains).not_to be_empty
          end
        end
      end

      context 'with regex validation type' do
        let(:validation_type) { :regex }

        include_examples 'successful validator instance'

        it 'has necessary validator instance result attributes' do
          expect(validator_instance_result.domain).not_to be_nil
          expect(validator_instance_result.mail_servers).to be_empty
        end
      end

      context 'with mx validation type' do
        let(:validation_type) { :mx }

        include_examples 'successful validator instance'

        it 'has necessary validator instance result attributes' do
          expect(validator_instance_result.domain).not_to be_nil
          expect(validator_instance_result.mail_servers).to eq(mx_servers)
        end
      end

      context 'with mx blacklist validation type' do
        let(:validation_type) { :mx_blacklist }

        include_examples 'successful validator instance'

        it 'has necessary validator instance result attributes' do
          expect(validator_instance_result.domain).not_to be_nil
          expect(validator_instance_result.mail_servers).to eq(mx_servers)
        end
      end

      context 'with smtp validation type' do
        let(:validation_type) { :smtp }

        include_examples 'successful validator instance'

        it 'has necessary validator instance result attributes' do
          expect(validator_instance_result.domain).not_to be_nil
          expect(validator_instance_result.mail_servers).to eq(mx_servers)
        end
      end

      context 'without params' do
        subject(:validator_instance) { create_validator }

        it 'creates successful smtp validator instance' do
          expect(validator_instance.result.success).to be(true)
          expect(validator_instance_result.domain).not_to be_nil
          expect(validator_instance_result.mail_servers).not_to be_empty
          expect(validator_instance_result.mail_servers).not_to eq(mx_servers)
          expect(validator_instance.validation_type).to eq(:smtp)
        end
      end
    end

    describe 'fail validator instance' do
      let(:validator_instance_result) { validator_instance.result }
      let(:validator_instance_result_configuration) { validator_instance_result.configuration }
      let(:success_status) { false }

      shared_examples 'fail validator instance' do
        it 'creates fail validator instance' do
          expect(validator_instance_result.success).to be(success_status)
          expect(validator_instance_result.email).not_to be_nil
          expect(validator_instance_result.errors).not_to be_empty
          expect(validator_instance_result_configuration).to be_an_instance_of(Truemail::Configuration)
        end
      end

      context 'with list match validation type' do
        let(:expected_vlidation_type) { :whitelist }

        shared_examples 'has necessary validator instance result attributes' do
          it 'has necessary validator instance result attributes' do
            expect(validator_instance_result.domain).not_to be_nil
            expect(validator_instance_result.errors).to include(:list_match)
            expect(validator_instance_result.mail_servers).to be_empty
            expect(validator_instance_result.smtp_debug).to be_nil
            expect(target_blacklist).not_to be_empty
            expect(validator_instance.validation_type).to eq(:blacklist)
          end
        end

        context 'with emails list validation type' do
          let(:validation_type) { :emails_list }
          let(:target_blacklist) { validator_instance_result_configuration.blacklisted_emails }

          include_examples 'fail validator instance'
          include_examples 'has necessary validator instance result attributes'
        end

        context 'with domains list validation type' do
          let(:validation_type) { :domains_list }
          let(:target_blacklist) { validator_instance_result_configuration.blacklisted_domains }

          include_examples 'fail validator instance'
          include_examples 'has necessary validator instance result attributes'
        end
      end

      context 'with regex validation type' do
        let(:validation_type) { :regex }

        include_examples 'fail validator instance'

        it 'has necessary validator instance result attributes' do
          expect(validator_instance_result.domain).not_to be_nil
          expect(validator_instance_result.errors).to include(validation_type)
          expect(validator_instance_result.mail_servers).to be_empty
          expect(validator_instance.validation_type).to eq(validation_type)
        end
      end

      context 'with mx validation type' do
        let(:validation_type) { :mx }

        include_examples 'fail validator instance'

        it 'has necessary validator instance result attributes' do
          expect(validator_instance_result.domain).not_to be_nil
          expect(validator_instance_result.errors).to include(validation_type)
          expect(validator_instance_result.mail_servers).to be_empty
          expect(validator_instance.validation_type).to eq(validation_type)
        end
      end

      context 'with mx blacklist validation type' do
        let(:validation_type) { :mx_blacklist }

        include_examples 'fail validator instance'

        it 'has necessary validator instance result attributes' do
          mail_servers = validator_instance_result.mail_servers
          blacklisted_mx_ip_addresses = validator_instance_result.configuration.blacklisted_mx_ip_addresses

          expect(validator_instance_result.domain).not_to be_nil
          expect(validator_instance_result.errors).to include(validation_type)
          expect(mail_servers).not_to be_empty
          expect(blacklisted_mx_ip_addresses).to eq(mail_servers)
          expect(validator_instance.validation_type).to eq(validation_type)
        end
      end

      context 'with smtp validation type' do
        let(:validation_type) { :smtp }

        shared_examples 'has necessary validator instance result attributes' do
          it 'has necessary validator instance result attributes' do
            expect(validator_instance_result.domain).not_to be_nil
            expect(validator_instance_result.errors).to include(validation_type)
            expect(validator_instance_result.mail_servers).to eq(mx_servers)
            expect(validator_instance_result.smtp_debug).not_to be_empty
            expect(validator_instance_result.smtp_debug.first.response.errors).to include(rcptto: rcptto_context)
            expect(validator_instance.validation_type).to eq(validation_type)
          end
        end

        context 'with default rcptto error' do
          let(:rcptto_context) { 'user not found' }

          include_examples 'fail validator instance'
          include_examples 'has necessary validator instance result attributes'
        end

        context 'with custom rcptto error' do
          let(:custom_rcptto_error) { 'custom rcptto error' }
          let(:rcptto_context) { custom_rcptto_error }
          let(:kwargs) { { success: success_status, rcptto_error: custom_rcptto_error } }

          include_examples 'fail validator instance'
          include_examples 'has necessary validator instance result attributes'
        end
      end
    end
  end
end
