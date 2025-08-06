# Eztz

[![Tests](https://github.com/cmason/eztz/actions/workflows/test.yml/badge.svg)](https://github.com/cmason/eztz/actions/workflows/test.yml)
[![Maintainability](https://qlty.sh/gh/cmason/projects/eztz/maintainability.svg)](https://qlty.sh/gh/cmason/projects/eztz)
[![Code Coverage](https://qlty.sh/gh/cmason/projects/eztz/coverage.svg)](https://qlty.sh/gh/cmason/projects/eztz)
[![Gem Version](https://badge.fury.io/rb/eztz.png)](http://badge.fury.io/rb/eztz)

Ruby wrapper for the [Google Time Zone API](https://developers.google.com/maps/documentation/timezone)

## Requirements

- Ruby >= 2.7

Other versions of Ruby may work, but the gem is tested against the following versions:

- "2.7"
- "3.0"
- "3.1"
- "3.2"
- "3.3"
- "3.4"

## Installation

Add this line to your application's Gemfile:

```ruby
 gem 'eztz'
```

And then execute:

```ruby
 bundle
```

Or install it yourself as:

```ruby
 gem install eztz
```

## Usage

An API key is required to access the Google Time Zone API. You can create a new
API key from the [Google Cloud Console](https://developers.google.com/maps/documentation/timezone/get-api-key).

```ruby
  # Set your API key
  Eztz.api_key = 'YOUR_API_KEY'

  # Pass location coordinates as a string
  $ Eztz.timezone(location: '29.65,-95.28')

  => #<Eztz::TimeZoneResponse:0x007fe71ba2df78 @timestamp=1488834591,
  @dst_offset=0, @error_message=nil, @raw_offset=-21600, @status="OK",
  @id="America/Chicago", @name="Central Standard Time">
```

or

```ruby
  # Pass location coordinates as an array
  $ Eztz.timezone(location: [29.65, -95.28])

  => #<Eztz::TimeZoneResponse:0x007fe71ba2df78 @timestamp=1488834591,
  @dst_offset=0, @error_message=nil, @raw_offset=-21600, @status="OK",
  @id="America/Chicago", @name="Central Standard Time">
```

Optional parameters include:

- `timestamp:` specifies the desired time as seconds since midnight,
  January 1, 1970 UTC. The Google Maps Time Zone API uses the timestamp to
  determine whether or not Daylight Savings should be applied. Times before 1970
  can be expressed as negative values. Defaults to the current time.
- `language:` The language in which to return results Defaults to 'en'.
  A list of supported languages can be found at <https://developers.google.com/maps/faq#languagesupport>

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake test` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/cmason/eztz>.
This project is intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the
[Contributor Covenant](https://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
