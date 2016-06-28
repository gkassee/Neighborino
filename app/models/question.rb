class Question < ActiveRecord::Base

	belongs_to :user
	has_many :comments

	def geocode_address
		[latitude, longitude].compact.join(', ')
	end

	geocoded_by :geocode_address
	after_validation :geocode

	
end
