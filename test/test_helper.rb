# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "eztz"
require "minitest/autorun"
require "webmock/minitest"
# WebMock.disable!
def stubbed_api_request(matching_params = {language: "en"})
  stub_request(:get, "https://maps.googleapis.com/maps/api/timezone/json")
    .with(query: hash_including(matching_params))
end

def stubbed_response
  File.new("test/fixtures/maps.googleapis.com.txt")
end
