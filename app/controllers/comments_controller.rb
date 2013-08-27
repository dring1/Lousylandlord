class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
  	@landlord = Landlord.find(params[:landlord_id])
  	if @comment.save
  	  flash[:success] = "Comment created!"
      redirect_to @landlord
  	else
  	  flash[:error] = "Error submitting comment"
  	end
  end 

end
	