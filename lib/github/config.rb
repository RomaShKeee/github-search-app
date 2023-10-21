# frozen_string_literal: true

require 'octokit'
require 'faraday-http-cache'

module Github
  module Config
    def self.included(base)
      base.class_eval do
        stack = Faraday::RackBuilder.new do |builder|
          builder.use Faraday::HttpCache, serializer: Marshal, shared_cache: false
          builder.use Octokit::Response::RaiseError
          builder.adapter Faraday.default_adapter
        end
        Octokit.middleware = stack
      end
    end
  end
end
