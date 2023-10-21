# frozen_string_literal: true

require_relative 'client'
require_relative 'query_validator'

module Github
  class ReposSearch
    attr_reader :error_message

    def initialize(query, client: Client.new(ENV['GITHUB_API_ACCESS_TOKEN']).client,
                   validator: QueryValidator.new(query))
      @query = query
      @client = client
      @validator = validator
      @error_message = nil
    end

    def repositories(per_page: 10, page: 1)
      unless @validator.valid?
        @error_message = @validator.error_message
        return []
      end

      @client.search_repositories(@query, per_page: per_page, page: page)[:items]
    rescue Octokit::Error => e
      @error_message = "An error occurred: #{e.message}"
      []
    end
  end
end
