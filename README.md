# Eztz

Ruby wrapper for the [Google Time Zone API](https://developers.google.com/maps/documentation/timezone)

[![Tests](https://github.com/cmason/eztz/actions/workflows/test.yml/badge.svg)](https://github.com/cmason/eztz/actions/workflows/test.yml)
[![Code Climate](https://codeclimate.com/github/cmason/eztz.png)](https://codeclimate.com/github/cmason/eztz)
[![Build Status](https://travis-ci.org/cmason/eztz.png?branch=master)](https://travis-ci.org/cmason/eztz)
[![Gem Version](https://badge.fury.io/rb/eztz.png)](http://badge.fury.io/rb/eztz)
[![Coverage Status](https://coveralls.io/repos/github/cmason/eztz/badge.svg?branch=remove-dependencies)](https://coveralls.io/github/cmason/eztz?branch=remove-dependencies)

## Installation

Add this line to your application's Gemfile:

```ruby
 gem 'eztz'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eztz

## Usage

    $ Eztz.timezone(location: '29.65,-95.28')

    => #<Eztz::TimeZoneResponse:0x007fe71ba2df78 @timestamp=1488834591, @dst_offset=0, @error_message=nil, @raw_offset=-21600, @status="OK", @id="America/Chicago", @name="Central Standard Time">

or

    $ Eztz.timezone(location: [29.65, -95.28])

    => #<Eztz::TimeZoneResponse:0x007fe71ba2df78 @timestamp=1488834591, @dst_offset=0, @error_message=nil, @raw_offset=-21600, @status="OK", @id="America/Chicago", @name="Central Standard Time">

Optional parameters include:

  * `timestamp:` specifies the desired time as seconds since midnight, January 1, 1970 UTC. The Google Maps Time Zone API uses the timestamp to determine whether or not Daylight Savings should be applied. Times before 1970 can be expressed as negative values. Defaults to the current time.
  * `language:` The language in which to return results Defaults to 'en'. A list of supported languages can be found at developers.google.com/maps/faq#languagesupport

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake test` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cmason/eztz. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
