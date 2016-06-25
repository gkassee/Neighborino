class User < ActiveRecord::Base

	has_many :questions
	has_many :comments

	#creates one string out of the different address objects on each user
  def address
  	[address1, city, state].compact.join(', ')
	end

	geocoded_by :address
  after_validation :geocode #gives me new latitude & longitude for the user every time they update their address
	
	# has_secure_password   
	# validates_confirmation_of :password   
	# validates_presence_of :password, on: :create

	def self.sign_in_from_omniauth(auth)
			find_or_create_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)
			create(
				provider: auth['provider'],
				uid: auth['uid'],
				name: auth['info']['name'],
				twitter_handle: auth['info']['nickname']
			)
	end


end
