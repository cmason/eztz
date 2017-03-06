# frozen_string_literal: true
require 'test_helper'

class EztzTest < Minitest::Test
  def setup
    Eztz.instance_variable_set(:@client, nil)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Eztz::VERSION
  end

  def test_it_assigns_an_api_key
    Eztz.api_key = 'MyKey'
    assert_equal Eztz.api_key, 'MyKey'
  end

  def test_it_can_assign_api_key_via_configuration_block
    Eztz.configure { |config| config.api_key = 'BlockKey' }
    assert_equal Eztz.api_key, 'BlockKey'
  end

  def test_client_is_assigned_api_key
    Eztz.api_key = 'MyKey'
    assert_equal Eztz.api_key, Eztz.client.api_key
  end

  def test_timezone_raises_error_without_a_location
    assert_raises(ArgumentError) { Eztz.timezone }
  end

  def test_timezone_raises_error_when_api_fails
    stubbed_api_request
      .to_return(status: [500, 'Internal Server Error'])
    assert_raises(Eztz::ApiError) { Eztz.timezone(location: [29.65, -95.28]) }
  end

  def test_timezone_returns_a_timezone_response
    stubbed_api_request.to_return(stubbed_response)
    res = Eztz.timezone(location: '29.65,-95.28', timestamp: 1_331_161_200)
    assert_kind_of Eztz::TimeZoneResponse, res
    assert_predicate res, :success?
    assert_equal res.id, 'America/Chicago'
  end
end
