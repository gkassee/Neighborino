Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
	# provider :twitter, Rails.application.secrets.CONSUMER_KEY, Rails.application.secrets.CONSUMER_SECRET
end