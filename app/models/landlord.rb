class Landlord < ActiveRecord::Base
    attr_accessible  :name, :comments_attributes
    has_many :comments, dependent: :destroy
    belongs_to :province
    belongs_to :city
    accepts_nested_attributes_for :comments

    validates :name, presence: true, 
    				length: {minimum: 2, maximum: 50}



    
   	
	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end

    self.per_page = 10
    default_scope order: 'landlords.name ASC'
end
