require 'httparty'
require 'hashie'

module Eztz
  class Client
    include HTTParty
    base_uri 'https://maps.googleapis.com'

    # Gets timezone information for a location on earth,
    # as well as that location's time offset from UTC.
    #
    # @param [Hash] params options to get timezone information.
    #   Must include :location or :lat & :lng
    # @option params [String] :location a comma-separated lat,lng tuple. (eg. "-33.86,151.20")
    # @option params [String, Float] :lat latitude (eg. -33.86)
    # @option params [String, Float] :lng longitude (ex. 151.20)
    # @option params [Boolean] :sensor specifies whether the application requesting data is using a sensor. Defaults to _false_
    # @option params [Integer] :timestamp specifies the desired time as seconds since midnight, January 1, 1970 UTC. Defaults to _now_
    # @option params [String] :language the language in which to return results. Defaults to _en_.
    # @raise [ArgumentError] if :location or :lat and :lng are not provided
    # @return [Hashie::Mash] the resulting timezone data. Response has the following properties:
    #   * *dstOffset* : the offset for daylight-savings time in seconds.
    #     This will be zero if the time zone is not in Daylight Savings Time during the specified timestamp.
    #   * *rawOffset* : the offset from UTC (in seconds) for the given location.
    #     This does not take into effect daylight savings.
    #   * *timeZoneId* : a string containing the ID of the time zone, such as "America/Los_Angeles" or "Australia/Sydney".
    #   * *timeZoneName* : a string containing the long form name of the time zone.
    #     This field will be localized if the language parameter is set.
    #     eg. "Pacific Daylight Time" or "Australian Eastern Daylight Time"
    #   * *status* : a string indicating the status of the response. Status will be one of the following:
    #     * *OK* - indicates that the request was successful.
    #     * *INVALID_REQUEST* - indicates that the request was malformed.
    #     * *OVER_QUERY_LIMIT* - indicates the requestor has exceeded quota.
    #     * *REQUEST_DENIED* - indicates that the the API did not complete the request. Confirm that the request was sent over http instead of https.
    #     * *UNKNOWN_ERROR* - indicates an unknown error.
    #     * *ZERO_RESULTS* - indicates that no time zone data could be found for the specified position or time.
    #       Confirm that the request is for a location on land, and not over water.
    # @example Get timezone data
    #   Eztz::Client.timezone(location: "-33.86,151.20")
    #   => #<Hashie::Mash dstOffset=3600.0 rawOffset=36000.0 status="OK" timeZoneId="Australia/Sydney" timeZoneName="Australian Eastern Daylight Time">
    def self.timezone(params={})
      params[:location] = "#{params.delete(:lat)},#{params.delete(:lng)}" if params[:lat] && params[:lng]
      raise ArgumentError, 'You must provide a location' if params[:location].nil? || params[:location].empty?
      params[:sensor] ||= false
      params[:timestamp] ||= Time.now.to_i
      Hashie::Mash.new self.get('/maps/api/timezone/json', query: params)
    end
  end
end
