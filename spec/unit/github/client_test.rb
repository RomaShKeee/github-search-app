# frozen_string_literal: true

require_relative '../spec_helper'

module Github
  class ClientTest < Minitest::Test
    def setup
      @client = Github::Client.new(ENV['GITHUB_API_ACCESS_TOKEN'])
    end

    def test_authentication
      VCR.use_cassette('github authentication') do
        assert @client.authenticated?
      end
    end

    def test_rate_limit
      VCR.use_cassette('github rate_limit') do
        refute_nil @client.rate_limit
      end
    end
  end
end
