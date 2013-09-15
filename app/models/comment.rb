class Comment < ActiveRecord::Base
	belongs_to :landlord

	validates :landlord_id, presence: true
	validates :ip, presence: true
	#validates :terms, presence: true
    validates :comment, presence: true, 
				length: {minimum: 15, maximum: 500}		

   	def self.setIP (var)
		self.ip = var
	end

	def setIP (var)
		self.ip = var
	end

	#default_scope order: 'comments.created_at DESC'
end
