# Quick Start

## Requirements

!> Ruby MRI 2.5.0+

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
