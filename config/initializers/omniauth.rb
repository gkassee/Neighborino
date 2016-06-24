Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
	# provider :twitter, Rails.application.secrets.CONSUMER_KEY, Rails.application.secrets.CONSUMER_SECRET
	# provider :twitter, 'uyZ1Z1z4FbY9XLvxDjYVBja3g', 'WTwaZVdH5vHqjNSgssWnjtRvFFuxBYnctVEuZr9aGj5mSQcWsq'
end