class Comment < ActiveRecord::Base
	attr_accessible :comment, :terms
	belongs_to :landlord

	#validates :landlord_id, presence: true
#	validates :ip, presence: true
	validates :terms, presence: true


   	def setIP (var)
		self.ip = var
	end

	default_scope order: 'comments.created_at DESC'
end
