class Landlord < ActiveRecord::Base
    attr_accessible  :name, :city, :province, :comments_attributes
    has_many :comments, dependent: :destroy
    accepts_nested_attributes_for :comments

    validates :name, presence: true, 
    				length: {minimum: 2, maximum: 50}

    validates :city, presence: true
    validates :province, presence: true

    
   	
	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end
end
