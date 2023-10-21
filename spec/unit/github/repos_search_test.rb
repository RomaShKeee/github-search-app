# frozen_string_literal: true

require_relative '../spec_helper'

module Github
  class ReposSearchTest < Minitest::Test
    def setup
      @search = Github::ReposSearch.new('rails')
    end

    def test_repositories_search
      VCR.use_cassette('github search repositories') do
        @repos = @search.repositories
      end
      refute_empty @repos
      assert_instance_of Array, @repos
    end

    def test_error_message
      refute_nil @search
      assert_nil @search.error_message
    end
  end
end
