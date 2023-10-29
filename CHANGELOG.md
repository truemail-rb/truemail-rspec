# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2023-10-29

### Updated

- Updated gem runtime/development dependencies
- Updated linters configs
- Updated gem readme, gem version

## [1.1.2] - 2023-08-15

### Updated

- Updated gem development dependencies
- Updated linters configs
- Updated gem readme, gem version

## [1.1.1] - 2023-08-06

### Updated

- Updated gem development dependencies
- Updated linters configs
- Updated gem readme, gem version

## [1.1.0] - 2023-02-16

### Added

- Added supporting of latest Ruby 3.2.0
- Added new bunch of project linters
- Added auto deploy to RubyGems
- Added auto creating release notes on GitHub

### Updated

- Updated development dependencies
- Updated gemspecs
- Updated `rubocop`/`codeclimate`/`circleci` configs
- Updated gem version

### Removed

- Removed `overcommit` dependency

## [1.0.0] - 2022-10-25

### Added

- Ability to create `Truemail::Validator` instance for `Whitelist/Blacklist` validation layer

### Updated

- Updated `Truemail::RSpec::ValidatorHelper::ValidatorFactory#process_validator_params`, tests
- Updated gem runtime dependencies
- Updated gem development dependencies
- Updated gem readme, gem version

## [0.9.2] - 2022-10-09

### Updated

- Updated gem runtime dependencies
- Updated gem development dependencies
- Updated gem readme, gem version

## [0.9.1] - 2022-03-02

### Updated

- Updated gem runtime dependencies
- Updated gem development dependencies
- Updated gem readme, gem version

## [0.9.0] - 2022-02-23

### Added

- Added development environment guide docs

### Updated

- Updated gem runtime dependencies
- Updated gem development dependencies
- Updated minimal Ruby version for RubyGems environment
- Updated CircleCI configs
- Updated contributing guide

## [0.8.0] - 2022-01-25

### Updated

- Updated gem runtime dependencies
- Updated gem development dependencies
- Updated default Ruby version for test environment
- Updated `rubocop`/`codeclimate` configs

## [0.7.0] - 2021-08-11

### Updated

- gem runtime dependencies
- gem development dependencies

### Changed

- `faker` to `ffaker` dependency

## [0.6.0] - 2021-05-13

### Added

```ruby
# Truemail::Validator instance, successful case
create_validator(:mx_blacklist)
=> #<Truemail::Validator:0x00007fea91a1d528
 @result=
  #<struct Truemail::Validator::Result
   success=true,
   email="danyell@brakus-dooley.co",
   domain="brakus-dooley.co",
   mail_servers=["175.244.212.125", "69.106.253.221", "7.125.70.85", "152.249.195.7"],
   errors={},
   smtp_debug=nil,
   configuration=
    #<Truemail::Configuration:0x00007fea98977248
     @blacklisted_domains=[],
     @blacklisted_mx_ip_addresses=[],
     @connection_attempts=2,
     @connection_timeout=2,
     @default_validation_type=:smtp,
     @dns=[],
     @email_pattern=/(?=\A.{6,255}\z)(\A([\p{L}0-9]+[\w|\-.+]*)@((?i-mx:[\p{L}0-9]+([\-.]{1}[\p{L}0-9]+)*\.\p{L}{2,63}))\z)/,
     @not_rfc_mx_lookup_flow=false,
     @response_timeout=2,
     @smtp_error_body_pattern=/(?=.*550)(?=.*(user|account|customer|mailbox)).*/i,
     @smtp_fail_fast=false,
     @smtp_safe_check=false,
     @validation_type_by_domain={},
     @verifier_domain="lubowitz.com",
     @verifier_email="shante.keeling@lubowitz.com",
     @whitelist_validation=false,
     @whitelisted_domains=[]>>,
 @validation_type=:mx_blacklist>

# Truemail::Validator instance, failure case
create_validator(:mx_blacklist, success: false)
=> #<Truemail::Validator:0x00007fea988cfd18
 @result=
  #<struct Truemail::Validator::Result
   success=false,
   email="mike.treutel@heathcote.biz",
   domain="heathcote.biz",
   mail_servers=["212.76.177.170", "253.244.87.72", "144.225.110.224"],
   errors={:mx_blacklist=>"blacklisted mx server ip address"},
   smtp_debug=nil,
   configuration=
    #<Truemail::Configuration:0x00007fea988ee150
     @blacklisted_domains=[],
     @blacklisted_mx_ip_addresses=["212.76.177.170", "253.244.87.72", "144.225.110.224"],
     @connection_attempts=2,
     @connection_timeout=2,
     @default_validation_type=:smtp,
     @dns=[],
     @email_pattern=/(?=\A.{6,255}\z)(\A([\p{L}0-9]+[\w|\-.+]*)@((?i-mx:[\p{L}0-9]+([\-.]{1}[\p{L}0-9]+)*\.\p{L}{2,63}))\z)/,
     @not_rfc_mx_lookup_flow=false,
     @response_timeout=2,
     @smtp_error_body_pattern=/(?=.*550)(?=.*(user|account|customer|mailbox)).*/i,
     @smtp_fail_fast=false,
     @smtp_safe_check=false,
     @validation_type_by_domain={},
     @verifier_domain="grant-flatley.org",
     @verifier_email="mariano@grant-flatley.org",
     @whitelist_validation=false,
     @whitelisted_domains=[]>>,
 @validation_type=:mx_blacklist>
```

- Ability to create `Truemail::Validator` instance for `MxBlacklist` validation layer
- Stub for `MxBlacklist` validation layer
- CircleCI config for using multiple Ruby versions

### Updated

- Updated gem development dependencies

### Fixed

- `simplecov` coverage issues

## [0.5.0] - 2021-05-05

### Added

- Ability to set size for servers list

```ruby
create_servers_list(42) # => returns array with 42 random ip addresses
```

### Updated

- gem runtime dependencies
- gem development dependencies

## [0.4.0] - 2021-02-24

### Updated

- gem runtime dependencies
- gem development dependencies

## [0.3.3] - 2020-12-06

### Added

- `faker` import

### Updated

- gem development dependencies

## [0.3.2] - 2020-12-06

### Fixed

- Namespace collisions for `faker`

## [0.3.1] - 2020-12-06

### Added

- Required `faker` runtime dependency

## [0.3.0] - 2020-12-06

### Added

Ability to pass custom context into `rcptto` error:

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
