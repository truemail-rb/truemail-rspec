# frozen_string_literal: true

require_relative 'lib/truemail/rspec/version'

Gem::Specification.new do |spec|
  spec.name          = 'truemail-rspec'
  spec.version       = Truemail::RSpec::VERSION
  spec.authors       = ['Vladislav Trotsenko']
  spec.email         = ['admin@bestweb.com.ua']

  spec.summary       = %(truemail-rspec)
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

  spec.required_ruby_version = '>= 2.5.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| ::File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ffaker', '~> 2.20'
  spec.add_runtime_dependency 'net-smtp', '~> 0.3.1' if ::RUBY_VERSION >= '3.1.0'
  spec.add_runtime_dependency 'rspec', '~> 3.11'
  spec.add_runtime_dependency 'truemail', '~> 2.7'

  spec.add_development_dependency 'ffaker', '~> 2.20'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  spec.add_development_dependency 'rspec', '~> 3.11'
end
