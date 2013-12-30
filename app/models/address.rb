class Address < ActiveRecord::Base
	belongs_to :city
	belongs_to :landlord
	#add regexes
	validates :city_id, presence: true
	validates :landlord_id, presence: true
	validates :street, presence: true
	validates :number, presence: true
	validates :unit, presence: true
	geocoded_by :get_address
	after_validation :geocode
	# validates :longitude, presence: true
	# validates :latitude, presence: true

	def get_address
		number + " " + street + " " + City.find(city_id).name + ", " + Province.find(City.find(city_id).province_id).name 
	end

end
