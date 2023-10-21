# frozen_string_literal: true

require_relative '../coverage_helper'
ENV['RACK_ENV'] = 'test'
require_relative '../../app'
Tilt.finalize!

require 'capybara'
require 'capybara/dsl'
require 'rack/test'

Gem.suffix_pattern

require_relative '../minitest_helper'

GithubSearchApp.plugin :not_found do
  raise '404 - File Not Found'
end
GithubSearchApp.plugin :error_handler do |e|
  raise e
end

GithubSearchApp.freeze if ENV['NO_AUTOLOAD']
Capybara.app = GithubSearchApp.app
Capybara.exact = true

module Minitest
  class HooksSpec
    include Rack::Test::Methods
    include Capybara::DSL

    def app
      Capybara.app
    end

    after do
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end
end
