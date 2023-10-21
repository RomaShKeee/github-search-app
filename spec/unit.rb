# frozen_string_literal: true

ENV['NO_AUTOLOAD'] = '1'
Dir['./spec/unit/*_test.rb'].each { |f| require f }
Dir['./spec/unit/*/*_test.rb'].each { |f| require f }
