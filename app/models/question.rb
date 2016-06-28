class Question < ActiveRecord::Base

	belongs_to :user
	has_many :comments

	def geocode_address
		[latitude, longitude].compact.join(', ')
	end

	geocoded_by :geocode_address
	after_validation :geocode

	has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"


	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	
end
