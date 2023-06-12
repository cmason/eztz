# frozen_string_literal: true

require "net/http"
require "json"

module Eztz
  # The Google Time Zone API client.
  # If you need to make requests with multiple api keys, then you'll probably
  # want to use this class directly.  Otherwise, it will be easier to use
  # {::Eztz#timezone Eztz.timezone}
  class Client
    attr_reader :api_key

    def initialize(api_key: Eztz.api_key)
      @api_key = api_key
      @uri = URI("https://maps.googleapis.com/maps/api/timezone/json")
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
    def timezone(location:, timestamp: Time.now.utc.to_i, language: "en")
      uri.query = query_params(location, timestamp, language)
      res = Net::HTTP.get_response(uri)
      raise ApiError, res.body unless res.is_a?(Net::HTTPSuccess)
      TimeZoneResponse.new(timestamp, JSON.parse(res.body))
    end

    private

    attr_reader :uri

    def query_params(location, timestamp, language)
      URI.encode_www_form(
        location: (location.respond_to?(:join) ? location.join(",") : location),
        timestamp: timestamp,
        language: language,
        key: api_key
      )
    end
  end
end
