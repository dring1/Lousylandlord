class CommentsController < ApplicationController

	def create

		#@landlord = Landlord.find_by(params[:])
	end

	def destroy
		Comment.find(params[:id]).destroy
    	flash[:success] = "Comment destroyed."
    	redirect_to :back
	end

end
	