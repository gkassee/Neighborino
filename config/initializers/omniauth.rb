Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :twitter, 'Ow1IaGrxFGN0LZijTENhbixqx', 'rXwL1cVxikghZuJgJDd2Mitn3oUdizWRjytWV7f3iAGJyscqae'
end