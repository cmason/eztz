# Eztz

Ruby wrapper for the [Google Time Zone API](https://developers.google.com/maps/documentation/timezone)

[![Code Climate](https://codeclimate.com/github/cmason/eztz.png)](https://codeclimate.com/github/cmason/eztz)
[![Build Status](https://travis-ci.org/cmason/eztz.png?branch=master)](https://travis-ci.org/cmason/eztz)
[![Gem Version](https://badge.fury.io/rb/eztz.png)](http://badge.fury.io/rb/eztz)

## Installation

Add this line to your application's Gemfile:

    gem 'eztz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eztz

## Usage

    $ Eztz.timezone(lat: -33.86, lng: 151.20)

    => #<Hashie::Mash dstOffset=3600.0 rawOffset=36000.0 status="OK" timeZoneId="Australia/Sydney" timeZoneName="Australian Eastern Daylight Time">

or

    $ Eztz.timezone(location: '-33.86,151.20')

    => #<Hashie::Mash dstOffset=3600.0 rawOffset=36000.0 status="OK" timeZoneId="Australia/Sydney" timeZoneName="Australian Eastern Daylight Time">

Params should take one of the following forms:

    { location: "-33.86,151.20" }
    { lat: -33.86, lng: 151.20 }

## Calculating the Local Time

The local time of a given location is the sum of the `Time.now.to_i` , and the `dstOffset` and `rawOffset` fields from the result.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This code is provided under the MIT license.  See [LICENSE](LICENSE) for more details.
