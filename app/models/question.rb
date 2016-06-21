class Question < ActiveRecord::Base

	belongs_to :user
	has_many :comments

	geocoded_by :ip_address
		# :latitude => :lat, :longitude => :lon
	after_validation :geocode
	
end
