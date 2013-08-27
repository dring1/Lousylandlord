class City < ActiveRecord::Base
	attr_accessible :name
  belongs_to :province
  has_many :landlords
end
