# frozen_string_literal: true

module Eztz
  # Encapsulates the data from the timezone api
  class TimeZoneResponse
    # @!attribute dst_offset [r]
    #   @return [Integer] The offset for daylight-savings time in seconds.
    #     This will be zero if the time zone is not in Daylight Savings Time
    #     during the specified timestamp.
    # @!attribute error_message [r]
    #   @return [String] More detailed information about the reasons behind the
    #     given status code, if other than OK.
    # @!attribute id [r]
    #   @return [String] A string containing the ID of the time zone, such as
    #     "America/Los_Angeles" or "Australia/Sydney".
    # @!attribute name [r]
    #   @return [String] A string containing the long form name of the time
    #     zone. This field will be localized if the language parameter was set.
    #     eg. "Pacific Daylight Time" or "Australian Eastern Daylight Time"
    # @!attribute raw_offset [r]
    #   @return [Integer] The offset from UTC (in seconds) for the given
    #     location. This does not take into effect daylight savings.
    # @!attribute status [r]
    #   @return [String] a string indicating the status of the response. Status
    #     will be one of the following:
    #     * *OK* - indicates that the request was successful.
    #     * *INVALID_REQUEST* - indicates that the request was malformed.
    #     * *OVER_QUERY_LIMIT* - indicates the requestor has exceeded quota.
    #     * *REQUEST_DENIED* - indicates that the the API did not complete the
    #       request. Confirm that the request was sent over http instead of
    #       https.
    #     * *UNKNOWN_ERROR* - indicates an unknown error.
    #     * *ZERO_RESULTS* - indicates that no time zone data could be found
    #       for the specified position or time. Confirm that the request is for
    #       a location on land, and not over water.
    # @!attribute timestamp [r]
    #   @return [Integer] The timestamp used in the request.
    attr_reader :dst_offset, :error_message, :id, :name,
                :raw_offset, :status, :timestamp

    # @param timestamp [Integer] The timestamp used in the request
    # @param response [Hash] The parsed JSON response from the api call
    def initialize(timestamp, response)
      @timestamp = timestamp
      @dst_offset, @error_message, @raw_offset, @status, @id, @name =
        response.values_at(
          'dstOffset', 'error_message', 'rawOffset', 'status', 'timeZoneId',
          'timeZoneName'
        )
    end

    def success?
      status == 'OK'
    end

    # The local time of the location is the sum of the :timestamp,
    # :dst_offset and :raw_offset.
    # @return [Time]
    def local_time
      Time.at(timestamp.to_i + dst_offset.to_i + raw_offset.to_i)
    end

    # The object as a Hash.
    # @return [Hash]
    def to_h
      {
        dst_offset:    dst_offset,
        error_message: error_message,
        id:            id,
        name:          name,
        raw_offset:    raw_offset,
        status:        status,
        timestamp:     timestamp
      }
    end
  end
end
