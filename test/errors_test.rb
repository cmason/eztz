# frozen_string_literal: true
require 'test_helper'

class ErrorsTest < Minitest::Test
  def test_api_error
    error_message = 'Doh!'
    err = Eztz::ApiError.new(error_message)
    assert_equal error_message, err.to_s
  end
end
