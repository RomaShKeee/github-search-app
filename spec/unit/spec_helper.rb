# frozen_string_literal: true

require_relative '../../.env'
require_relative '../coverage_helper'
ENV['RACK_ENV'] = 'test'

require 'rack/test'

require_relative '../../lib/github/client'
require_relative '../../lib/github/query_validator'
require_relative '../../lib/github/repos_search'
require_relative '../../lib/github/config'

require_relative '../minitest_helper'

# GithubSearchApp.freeze if ENV['NO_AUTOLOAD']

module Minitest
  class HooksSpec
    include Rack::Test::Methods

    def app
      GithubSearchApp.app
    end
  end
end
