require "eztz/client"
require "eztz/version"

module Eztz
  # Gets timezone information for a location on earth,
  # as well as that location's time offset from UTC.
  #
  # @param [Hash] params options to get timezone information.
  #   Must include :location or :lat & :lng
  # @option params [String] :location a comma-separated lat,lng tuple. (eg. "-33.86,151.20")
  # @option params [String, Float] :lat latitude (eg. -33.86)
  # @option params [String, Float] :lng longitude (ex. 151.20)
  # @raise [ArgumentError] if :location or :lat and :lng are not provided
  # @return [Hashie::Mash] the resulting timezone data.
  # @example Get timezone data
  #   Eztz.timezone(lat: -33.86, lng: 151.20)
  #   => #<Hashie::Mash dstOffset=3600.0 rawOffset=36000.0 status="OK" timeZoneId="Australia/Sydney" timeZoneName="Australian Eastern Daylight Time">
  # @see Client.timezone
  def self.timezone(params={})
    Eztz::Client.timezone(params)
  end
end
