# ![Truemail RSpec helpers](https://truemail-rb.org/assets/images/truemail_logo.png)

[![Maintainability](https://api.codeclimate.com/v1/badges/d23d82c1c1bdbc271b81/maintainability)](https://codeclimate.com/github/truemail-rb/truemail-rspec/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d23d82c1c1bdbc271b81/test_coverage)](https://codeclimate.com/github/truemail-rb/truemail-rspec/test_coverage)
[![CircleCI](https://circleci.com/gh/truemail-rb/truemail-rspec/tree/master.svg?style=svg)](https://circleci.com/gh/truemail-rb/truemail-rspec/tree/master)
[![Gem Version](https://badge.fury.io/rb/truemail-rspec.svg)](https://badge.fury.io/rb/truemail-rspec)
[![Downloads](https://img.shields.io/gem/dt/truemail-rspec.svg?colorA=004d99&colorB=0073e6)](https://rubygems.org/gems/truemail-rspec)
[![Gitter](https://badges.gitter.im/truemail-rb/community.svg)](https://gitter.im/truemail-rb/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![GitHub](https://img.shields.io/github/license/truemail-rb/truemail-rspec)](LICENSE.txt)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

`truemail-rspec` gem helps you to create `Truemail::Configuration`, `Truemail::Auditor` and `Truemail::Validator` instances for your RSpec environment.

> Actual and maintainable documentation :books: for developers is living [here](https://truemail-rb.org/truemail-rspec).

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
  - [Create configuration instance](#create-configuration-instance)
    - [Configuration instance with default random params](#configuration-instance-with-default-random-params)
    - [Configuration instance with predefined params](#configuration-instance-with-predefined-params)
  - [Create auditor instance](#create-auditor-instance)
    - [create_auditor](#create_auditor)
  - [Create validator instance](#create-validator-instance)
    - [create_servers_list](#create_servers_list)
    - [create_validator](#create_validator)
- [Truemail family](#truemail-family)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)
- [Credits](#credits)
- [Versioning](#versioning)
- [Changelog](CHANGELOG.md)

## Requirements

Ruby MRI 2.5.0+

## Features

- Ability to create `Truemail::Configuration` instance with random or with predefined params
- Ability to create `Truemail::Auditor` instance with random or with predefined params
- Ability to create `Truemail::Validator` instance with random or with predefined params

## Installation

Add this line to your application's `Gemfile`:

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

Allows to create configuration instance with random or with predefined params.

#### Configuration instance with default random params

```ruby
create_configuration

# => returns Truemail::Configuration instance with
# random verifier_email and default Truemail::Configuration params
```

#### Configuration instance with predefined params

All `Truemail::Configuration` [available params](https://github.com/truemail-rb/truemail#setting-global-configuration)

```ruby
create_configuration(verifier_email: 'email@domain.com', verifier_domain: 'other-domain.com')
# => returns Truemail::Configuration instance with custom settings
```

### Create auditor instance

Allows to create auditor instance with default random or with predefined params.

#### create_auditor

```ruby
create_auditor(
  success: true, # optional, type:Bool, by default true
  current_host_ip: current_host_ip, # optional, type:String, by default random IPv4 address
  warnings: warnings, # optional, type:Hash, by default creates auditor result warnings
  configuration: create_configuration # optional, type:Truemail::Configuration, by default creates random configuration
)

# => returns Truemail::Auditor instance follow passed params
```

### Create validator instance

Allows to create validator instance with default random or with predefined params.

#### create_servers_list

```ruby
create_servers_list # => returns array with random ip addresses
create_servers_list(42) # => returns array with 42 random ip addresses
```

#### create_validator

```ruby
create_validator(
  validation_type, # optional, type:Symbol, can be :emails_list, :domains_list, :regex, :mx, :mx_blacklist or :smtp, by default creates :smtp validation
  email, # optional, type:String, by default random email
  mail_servers, # optional, type:Array(String), by default array with random ip addresses
  success: true, # optional, type:Bool, by default true
  rcptto_error: 'custom context of rcptto error' # optional, type:String, by default it's equal to 'user not found'
  configuration: create_configuration # optional, type:Truemail::Configuration, by default creates random configuration
)

# => returns Truemail::Validator instance follow passed params
```

---

## Truemail family

All Truemail solutions: https://truemail-rb.org

| Name | Type | Description |
| --- | --- | --- |
| [truemail](https://github.com/truemail-rb/truemail) | ruby gem | Configurable framework agnostic plain Ruby email validator, main core |
| [truemail-go](https://github.com/truemail-rb/truemail-go) | go package | Configurable Golang email validator, main core |
| [truemail server](https://github.com/truemail-rb/truemail-rack) | ruby app | Lightweight rack based web API wrapper for Truemail gem |
| [truemail-rack-docker](https://github.com/truemail-rb/truemail-rack-docker-image) | docker image | Lightweight rack based web API [dockerized image](https://hub.docker.com/r/truemail/truemail-rack) :whale: of Truemail server |
| [truemail-ruby-client](https://github.com/truemail-rb/truemail-ruby-client) | ruby gem | Web API Ruby client for Truemail Server |
| [truemail-crystal-client](https://github.com/truemail-rb/truemail-crystal-client) | crystal shard | Web API Crystal client for Truemail Server |
| [truemail-java-client](https://github.com/truemail-rb/truemail-java-client) | java lib | Web API Java client for Truemail Server |

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/truemail-rb/truemail-rspec. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct. Please check the [open tickets](https://github.com/truemail-rb/truemail-rspec/issues). Be sure to follow Contributor Code of Conduct below and our [Contributing Guidelines](CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the `truemail-rspec` project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Credits

- [The Contributors](https://github.com/truemail-rb/truemail-rspec/graphs/contributors) for code and awesome suggestions
- [The Stargazers](https://github.com/truemail-rb/truemail-rspec/stargazers) for showing their support

## Versioning

`truemail-rspec` uses [Semantic Versioning 2.0.0](https://semver.org)
