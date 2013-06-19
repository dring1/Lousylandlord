class User < ActiveRecord::Base
    attr_accessible :comment, :ip, :submit, :name, :terms
    validates_acceptance_of :terms
    validates :name, presence: true, length: {maximum: 50}
    validates :comment, presence: true, length: {maximum: 500}
   	
    #ensure the user IP is not blank

   	def setIP (var)
		self.ip = var
	end

	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end
end