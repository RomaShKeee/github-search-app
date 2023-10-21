# frozen_string_literal: true

require 'octokit'
require_relative '../github/config'

module Github
  class Client
    include Github::Config

    attr_reader :client

    def initialize(token, client: nil)
      @client = client || Octokit::Client.new(access_token: token)
    end

    def authenticated?
      !@client.user.nil?
    rescue Octokit::Unauthorized => e
      puts "Authentication error: #{e.message}"
      false
    end

    def rate_limit
      @client.rate_limit.remaining
    rescue Octokit::Error => e
      puts "An error occurred: #{e.message}"
      nil
    end
  end
end
