Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :twitter, 'c6m9LHX8KzreeSu4XGsd2KPPl', 'hY8JZqujFlRc9Pa9gFBvzzpQjsDpCdBkv4NLmO5aaKd9aEvcKG', :image_size => 'original'
end