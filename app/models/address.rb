class Address < ActiveRecord::Base
	belongs_to :city
	belongs_to :landlord
	#add regexes
	validates :city_id, presence: true
	validates :landlord_id, presence: true
	validates :street, presence: true
	validates :number, presence: true
	validates :unit, presence: true
	# validates :longitude, presence: true
	# validates :latitude, presence: true

	def latlng
		[self.latitude, self.longitude]
	end
end
