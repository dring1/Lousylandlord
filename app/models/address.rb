class Address < ActiveRecord::Base
	belongs_to :city
	belongs_to :landlord

	validates :city_id, presence: true

end
