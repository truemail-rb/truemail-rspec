# frozen_string_literal: true

require_relative 'lib/truemail/rspec/version'

Gem::Specification.new do |spec|
  spec.name          = 'truemail-rspec'
  spec.version       = Truemail::RSpec::VERSION
  spec.authors       = ['Vladislav Trotsenko']
  spec.email         = ['admin@bestweb.com.ua']

  spec.summary       = %(Truemail RSpec helpers)
  spec.description   = %(Truemail RSpec helpers)

  spec.homepage      = 'https://github.com/truemail-rb/truemail-rspec'
  spec.license       = 'MIT'

  spec.metadata = {
    'homepage_uri' => 'https://truemail-rb.org',
    'changelog_uri' => 'https://github.com/truemail-rb/truemail-rspec/blob/master/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/truemail-rb/truemail-rspec',
    'documentation_uri' => 'https://truemail-rb.org/truemail-rspec',
    'bug_tracker_uri' => 'https://github.com/truemail-rb/truemail-rspec/issues'
  }

  current_ruby_version = ::Gem::Version.new(::RUBY_VERSION)
  ffaker_version = current_ruby_version >= ::Gem::Version.new('3.0.0') ? '~> 2.23' : '~> 2.21'

  spec.required_ruby_version = '>= 2.5.0'
  spec.files = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(bin|lib)/|.ruby-version|truemail-rspec.gemspec|LICENSE}) }
  spec.require_paths = %w[lib]

  spec.add_runtime_dependency 'ffaker', ffaker_version
  spec.add_runtime_dependency 'net-smtp', '~> 0.4.0.1' if current_ruby_version >= ::Gem::Version.new('3.1.0')
  spec.add_runtime_dependency 'rspec', '~> 3.12'
  spec.add_runtime_dependency 'truemail', '~> 3.0'

  spec.add_development_dependency 'ffaker', ffaker_version
  spec.add_development_dependency 'rake', '~> 13.1'
  spec.add_development_dependency 'rspec', '~> 3.12'
end
