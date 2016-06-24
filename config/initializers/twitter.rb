$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = Rails.application.secrets.CONSUMER_KEY
  config.consumer_secret = Rails.application.secrets.CONSUMER_SECRET
  config.access_token = Rails.application.secrets.ACCESS_TOKEN
  config.access_token_secret = Rails.application.secrets.ACCESS_SECRET
end