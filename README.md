# <img src='https://repository-images.githubusercontent.com/222414074/393c9600-09f9-11ea-8d21-345619b97b11' height='250' alt='Truemail RSpec helpers' />

[![Maintainability](https://api.codeclimate.com/v1/badges/d23d82c1c1bdbc271b81/maintainability)](https://codeclimate.com/github/truemail-rb/truemail-rspec/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/d23d82c1c1bdbc271b81/test_coverage)](https://codeclimate.com/github/truemail-rb/truemail-rspec/test_coverage) [![CircleCI](https://circleci.com/gh/truemail-rb/truemail-rspec/tree/master.svg?style=svg)](https://circleci.com/gh/truemail-rb/truemail-rspec/tree/master) [![Gem Version](https://badge.fury.io/rb/truemail-rspec.svg)](https://badge.fury.io/rb/truemail-rspec) [![Downloads](https://img.shields.io/gem/dt/truemail-rspec.svg?colorA=004d99&colorB=0073e6)](https://rubygems.org/gems/truemail-rspec) [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

`truemail-rspec` gem helps you create `Truemail::Configuration` and `Truemail::Validator` instances for your RSpec environment.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Create configuration instance](#create-configuration-instance)
    - [Configuration instance with default random params](#configuration-instance-with-default-random-params)
    - [Configuration instance with predefined params](#configuration-instance-with-predefined-params)
  - [Create validator instance](#create-validator-instance)
    - [create_servers_list](#create_servers_list)
    - [create_validator DSL](#create_validator-dsl)
- [Truemail family](#truemail-family)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)
- [Versioning](#versioning)
- [Changelog](CHANGELOG.md)

## Features

- Ability to create `Truemail::Configuration` instance with random or with predefined params
- Ability to create `Truemail::Validator` instance with random or with predefined params

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'truemail-rspec', require: false
end
```

And add into your `spec_helper.rb` or `rails_helper.rb`:

```ruby
require 'truemail/rspec'

RSpec.configure do |config|
  config.include Truemail::RSpec
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install truemail-rspec

## Usage

### Create configuration instance

Allow to create configuration instance with random or with predefined params.

#### Configuration instance with default random params

```ruby
create_configuration

# => returns Truemail::Configuration instance with
# random verifier_email and default Truemail::Configuration params
```

#### Configuration instance with predefined params

All `Truemail::Configuration` [available params](https://github.com/truemail-rb/truemail-rspec#setting-global-configuration)

```ruby
create_configuration(verifier_email: 'email@domain.com', verifier_domain: 'other-domain.com')
# => returns Truemail::Configuration instance with custom settings
```

### Create validator instance

Allow to create validator instance with default random or with predefined params.

#### create_servers_list

```ruby
create_servers_list # => returns array with random ip addresses
```

#### create_validator DSL

```ruby
create_validator(
  validation_type, # optional, type:Symbol, can be :regex, :mx or :smtp, by default creates :smtp validation
  email, # optional, type:String, by default random email
  mail_servers, # optional, type:Array(String), by default array with random ip addresses
  success: true, # optional, type:Bool, by default true
  configuration: create_configuration # optional, type:Truemail::Configuration, by default creates random configuration
)

# => returns Truemail::Validator instance follow passed params
```

---

## Truemail family

All Truemail extensions: https://github.com/truemail-rb

### truemail

gem `truemail` - Configurable plain Ruby email validator, https://github.com/rubygarage/truemail

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/truemail-rb/truemail-rspec. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct. Please check the [open tikets](https://github.com/truemail-rb/truemail-rspec/issues). Be shure to follow Contributor Code of Conduct below and our [Contributing Guidelines](CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the `truemail-rspec` project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Versioning

`truemail-rspec` uses [Semantic Versioning 2.0.0](https://semver.org)
