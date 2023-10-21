# frozen_string_literal: true

module Github
  class QueryValidator
    MIN_LENGTH = 3
    MAX_LENGTH = 255

    def initialize(query)
      @query = query.to_s.strip
    end

    def valid?
      validate
      @error_message.nil?
    end

    def error_message
      @error_message || 'No error.'
    end

    private

    def validate
      if @query.empty?
        @error_message = 'Query cannot be empty.'
      elsif @query.length < MIN_LENGTH
        @error_message = "Query is too short. It must be at least #{MIN_LENGTH} characters long."
      elsif @query.length > MAX_LENGTH
        @error_message = "Query is too long. It must be less than #{MAX_LENGTH} characters long."
      end
    end
  end
end
