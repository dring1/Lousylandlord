class Landlord < ActiveRecord::Base

    has_many :comments, dependent: :destroy
    has_many :addresses, dependent: :destroy

    belongs_to :province
    belongs_to :city

    accepts_nested_attributes_for :comments, :addresses

    validates :name, presence: true, 
    				length: {minimum: 2, maximum: 50}

    validates :city_id, presence: true
    validates :province_id, presence: true

    
   	
	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end

    self.per_page = 10
    
    default_scope {order('landlords.name ASC')}
end
