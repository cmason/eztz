# frozen_string_literal: true

require "eztz/client"
require "eztz/errors"
require "eztz/response"
require "eztz/version"

# Ruby wrapper for the Google Time Zone API.
# @example Sample usage
#   # Set your api key
#   Eztz.api_key = 'YOUR_API_KEY'
#   # location as a string
#   Eztz.timezone(location: "-33.86,151.20")
#   # location as an array
#   Eztz.timezone(location: [-33.86,151.20])
module Eztz
  class << self
    # @!attribute api_key
    #   @return [String] Your application's API key.
    #     Api keys can be obtained at
    #     https://developers.google.com/maps/documentation/timezone/get-api-key
    attr_accessor :api_key

    # @example Configure api key with a configuration block
    #   Eztz.configure do |config|
    #     config.api_key = 'XYZ'
    #   end
    def configure
      yield self
      true
    end

    # The Eztz client
    # @return [Eztz::Client]
    def client
      @client ||= Eztz::Client.new
    end

    # Gets timezone information for a location on earth,
    # as well as that location's time offset from UTC.
    #
    # @param location [String, Array] a comma-separated lat,lng tuple
    #   (eg. "-33.86,151.20"), representing the location to look up. Can also be
    #   an array (eg. [-33.86, 151.20]).
    # @param timestamp [Integer] specifies the desired time as seconds
    #   since midnight, January 1, 1970 UTC. The Google Maps Time Zone API uses
    #   the timestamp to determine whether or not Daylight Savings should be
    #   applied. Times before 1970 can be expressed as negative values.
    #   Defaults to the current time.
    # @param language [String] The language in which to return results
    #   Defaults to 'en'. A list of supported languages can be found at
    #   https://developers.google.com/maps/faq#languagesupport
    # @raise [ArgumentError] if location is not provided
    # @raise [ApiError] if the API returns an error response.
    # @return [Eztz::TimeZoneResponse] the resulting timezone data.
    # @example Get the timezone for a location
    #   Eztz.timezone(location: "-33.86,151.20")
    #   => #<Eztz::TimeZoneResponse:0x007fe71c906298 @timestamp=1488580176,
    #     @dst_offset=3600, @error_message=nil, @raw_offset=36000,
    #     @status="OK", @id="Australia/Sydney",
    #     @name="Australian Eastern Daylight Time">
    def timezone(location:, timestamp: Time.now.utc.to_i, language: "en")
      client.timezone(location: location,
        timestamp: timestamp,
        language: language)
    end
  end
end
