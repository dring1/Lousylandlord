class CommentsController < ApplicationController

	def create

		comment_params = {comment: params[:comment][:comment],landlord_id: params[:id]}
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:success] = "Thank you for submitting a comment!"
			redirect_to Landlord.find(params[:id])
		else
			flash[:error] = "Comments must be between 15 and 500 characters!"
			redirect_to Landlord.find(params[:id])
		end

	end

	def destroy
		Comment.find(params[:id]).destroy
    	flash[:success] = "Comment destroyed."
    	redirect_to :back
	end

private

	def comment_strong_params
		params.require(:comment).permit(:comment,:id, :landlord_id)
	end


end
	