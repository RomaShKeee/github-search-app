# frozen_string_literal: true

require_relative '../spec_helper'

module Github
  class ClientTest < Minitest::Test
    def setup
      @client = Github::Client.new(ENV['GITHUB_API_ACCESS_TOKEN'])
    end

    def test_authentication
      assert @client.authenticated?
    end

    def test_rate_limit
      refute_nil @client.rate_limit
    end
  end
end
