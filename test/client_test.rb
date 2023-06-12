# frozen_string_literal: true

require "test_helper"

class ClientTest < Minitest::Test
  def setup
    @client = Eztz::Client.new(api_key: "MyKey")
  end

  def test_it_has_an_api_key
    assert_equal @client.api_key, "MyKey"
  end

  def test_it_raises_error_without_a_location
    assert_raises(ArgumentError) { @client.timezone }
  end

  def test_it_raises_error_when_api_fails
    stubbed_api_request
      .to_return(status: [500, "Internal Server Error"])
    assert_raises(Eztz::ApiError) do
      @client.timezone(location: [29.65, -95.28])
    end
  end

  def test_it_returns_a_timezone_response
    stubbed_api_request(location: "29.65,-95.28", timestamp: "1331161200")
      .to_return(stubbed_response)
    res = @client.timezone(location: [29.65, -95.28], timestamp: 1_331_161_200)
    assert_kind_of Eztz::TimeZoneResponse, res
    assert_predicate res, :success?
    assert_equal res.id, "America/Chicago"
  end
end
