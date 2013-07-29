class City < ActiveRecord::Base
  attr_accessible :name
  belongs_to :province
end
