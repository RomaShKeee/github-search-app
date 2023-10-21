# frozen_string_literal: true

case ENV['RACK_ENV'] ||= 'development'
when 'test'
  ENV['GITHUB_API_ACCESS_TOKEN'] ||= ''
  ENV['GITHUB_SEARCH_APP_SESSION_SECRET'] ||= ""
when 'production'
  ENV['GITHUB_API_ACCESS_TOKEN'] ||= ''
  ENV['GITHUB_SEARCH_APP_SESSION_SECRET'] ||= ""
else
  ENV['GITHUB_API_ACCESS_TOKEN'] ||= ''
  ENV['GITHUB_SEARCH_APP_SESSION_SECRET'] ||= "XxWSDx6J43KsCLYY5BFyzLObib1gIWEKiUYNUo96+kzy5rp+kdWI0eCbOeOW\nsp1d46aYl0RQRPdCFK6zDvaYCw==\n".unpack1('m')
end
