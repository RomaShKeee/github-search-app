# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/github/config'

module Github
  class ConfigTest < Minitest::Test
    include Github::Config

    def test_that_octokit_middleware_is_configured
      middleware = Octokit.middleware

      assert(middleware.handlers.any? { |handler| handler.klass == Faraday::HttpCache },
             'Expected Faraday::HttpCache to be part of the Octokit middleware stack')

      assert(middleware.handlers.any? { |handler| handler.klass == Octokit::Response::RaiseError },
             'Expected Octokit::Response::RaiseError to be part of the Octokit middleware stack')
    end
  end
end
