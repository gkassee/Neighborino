class User < ActiveRecord::Base

	validates_confirmation_of :name, :address1, :city, :state, :zip
	validates_presence_of :name, :address1, :city, :state, :zip, on: :update

	validates :name, uniqueness: true

	has_many :questions
	has_many :comments

	#creates one string out of the different address objects on each user
  def address
  	[address1, city, state, zip].compact.join(', ')
	end

	geocoded_by :address
  after_validation :geocode #gives me new latitude & longitude for the user every time they update their address
	
	def self.sign_in_from_omniauth(auth)
			find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)
			create(
				provider: auth['provider'],
				uid: auth['uid'],
				name: auth['info']['name'],
				twitter_handle: auth['info']['nickname'],
				profile_pic: auth['info']['image'],
				bio: auth['info']['description']
			)
	end


end
