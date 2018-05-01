Restforce.configure do |config|
  config.host          = ENV['SALESFORCE_HOST']
  config.username      = ENV['SALESFORCE_USERNAME']
  config.password      = ENV['SALESFORCE_PASSWORD']
  config.client_id     = ENV['SALESFORCE_CLIENT_ID']
  config.client_secret = ENV['SALESFORCE_CLIENT_SECRET']
  config.api_version   = ENV['SALESFORCE_API_VERSION']
end
