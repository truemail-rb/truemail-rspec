# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'truemail/rspec/version'

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
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2', '>= 2.2.17'
  spec.add_development_dependency 'bundler-audit', '~> 0.8.0'
  spec.add_development_dependency 'faker', '~> 2.17'
  spec.add_development_dependency 'fasterer', '~> 0.9.0'
  spec.add_development_dependency 'overcommit', '~> 0.57.0'
  spec.add_development_dependency 'pry-byebug', '~> 3.9'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
  spec.add_development_dependency 'reek', '~> 6.0', '>= 6.0.4'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.14'
  spec.add_development_dependency 'rubocop-performance', '~> 1.11', '>= 1.11.3'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.3'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_runtime_dependency 'faker', '~> 2.17'
  spec.add_runtime_dependency 'rspec', '~> 3.10'
  spec.add_runtime_dependency 'truemail', '>= 2.4'
end
