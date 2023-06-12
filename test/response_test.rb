# frozen_string_literal: true

require "test_helper"

class ResponseTest < Minitest::Test
  def setup
    @timestamp = Time.now.to_i
  end

  def successful_response
    JSON.parse('{
                  "dstOffset": 3600,
                  "rawOffset": 36000,
                  "status": "OK",
                  "timeZoneId": "Australia/Sydney",
                  "timeZoneName": "Australian Eastern Daylight Time"
                }')
  end

  def invalid_response
    JSON.parse '{ "status": "ZERO_RESULTS" }'
  end

  def test_successful_response
    res = Eztz::TimeZoneResponse.new(@timestamp, successful_response)
    assert res.success?
    assert_equal res.dst_offset, 3_600
    assert_equal res.raw_offset, 36_000
    assert_equal res.status, "OK"
    assert_equal res.id, "Australia/Sydney"
    assert_equal res.name, "Australian Eastern Daylight Time"
  end

  def test_invalid_response
    res = Eztz::TimeZoneResponse.new(@timestamp, invalid_response)
    refute res.success?
    assert_equal res.status, "ZERO_RESULTS"
  end

  def test_it_can_be_coerced_to_a_has
    res = Eztz::TimeZoneResponse.new(@timestamp, successful_response)
    assert_kind_of Hash, res.to_h
  end

  def test_it_calculates_local_time
    res = Eztz::TimeZoneResponse.new(@timestamp, successful_response)
    assert_in_delta res.local_time.to_i, @timestamp, 39_600
  end
end
