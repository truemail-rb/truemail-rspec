# Changelog
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.1] - 2020-12-06

### Added

- Required `faker` runtime dependency

## [0.3.0] - 2020-12-06

### Added

Ability to pass custom context into rcptto error:

```ruby
create_validator(
  validation_type, # optional, type:Symbol, can be :regex, :mx or :smtp, by default creates :smtp validation
  email, # optional, type:String, by default random email
  mail_servers, # optional, type:Array(String), by default array with random ip addresses
  success: true, # optional, type:Bool, by default true
  rcptto_error: 'custom context of rcptto error' # optional, type:String, by default it's equal to 'user not found'
  configuration: create_configuration # optional, type:Truemail::Configuration, by default creates random configuration
)
```

### Changed

- Updated `Truemail::RSpec::ValidatorHelper`
- gem development, runtime dependencies
- gem documentation

## [0.2.1] - 2020-09-21

### Changed

Migrated to updated Ruby 2.7.x syntax.

- Updated `Truemail::RSpec::ConfigurationHelper`

## [0.2.0] - 2020-08-31

### Added

- auditor RSpec helper

### Removed

- gem public documentation

## [0.1.3] - 2020-08-24

### Added

- gem public documentation

### Changed

- gem development dependencies
- linters configs

## [0.1.2] - 2020-05-08

### Changed

- gem development dependencies
- gem documentation

## [0.1.1] - 2019-11-22

### Changed

- gem development dependencies
- linters configs
- gem documentation

## [0.1.0] - 2019-11-19

### Added

- configuration RSpec helper
- validator RSpec helper
- gem documentation
