class Province < ActiveRecord::Base
  has_many :cities
  has_many :landlords
end
