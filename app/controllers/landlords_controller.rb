class LandlordsController < ApplicationController
  def new
  	@landlord = Landlord.new
    @landlord.comments.build
  end

  def index
    @landlords = Landlord.order(:name).search(params[:search])
  end

  def show  	

  end

  def create  	
    #check if a landlord of the same name already exists and add comments to that
  	@landlord = Landlord.new(params[:landlord])
    @landlord.comments[0].setIP request.remote_ip
      if @landlord.save
       # comment = Comment.find(params[:comment_id])
        
        flash[:success] = "Thank you for submitting a Landlord"
        redirect_to landlords_path
      else

      end

  end

  def update
  end

  def destroy
  end

end
