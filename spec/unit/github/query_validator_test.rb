require_relative '../spec_helper'

module Github
  class QueryValidatorTest < Minitest::Test
    def test_valid_query
      validator = Github::QueryValidator.new('valid query')
      assert validator.valid?, validator.error_message
    end

    def test_empty_query
      validator = QueryValidator.new('')
      refute validator.valid?
      assert_equal 'Query cannot be empty.', validator.error_message
    end

    def test_short_query
      validator = QueryValidator.new('ab')
      refute validator.valid?
      assert_equal 'Query is too short. It must be at least 3 characters long.', validator.error_message
    end

    def test_long_query
      long_query = 'a' * 256
      validator = QueryValidator.new(long_query)
      refute validator.valid?
      assert_equal 'Query is too long. It must be less than 255 characters long.', validator.error_message
    end
  end
end
