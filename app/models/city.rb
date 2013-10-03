class City < ActiveRecord::Base
  belongs_to :province
  has_many :landlords
  has_many :address
end
