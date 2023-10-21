# frozen_string_literal: true

ENV['MT_NO_PLUGINS'] = '1' # Work around stupid autoloading of plugins
gem 'minitest'
require 'minitest/global_expectations/autorun'
require 'minitest/hooks/default'

module Minitest
  class HooksSpec
    def log
      LOGGER.level = Logger::INFO
      yield
    ensure
      LOGGER.level = Logger::FATAL
    end
  end
end

freeze_core = false # change to true to enable refrigerator
if freeze_core
  at_exit do
    require 'refrigerator'
    Refrigerator.freeze_core
  end
end
