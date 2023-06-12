# frozen_string_literal: true

require "json"

module Eztz
  # Thrown when the API returns an error response.
  class ApiError < StandardError
    attr_reader :message

    def initialize(response)
      @message = response
    end

    def to_s
      @message.to_s
    end
  end
end
