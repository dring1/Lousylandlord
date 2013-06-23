class LandlordsController < ApplicationController
  def new
  	@landlord = Landlord.new
    @landlord.comments.build
  end

  def index
    @landlords = Landlord.order(:name).search(params[:search])
  end

  def show  	
    @landlord = Landlord.find(params[:id])
  end

  def create  	
    #check if a landlord of the same name already exists and add comments to that
  	@landlord = Landlord.where(:name => params[:landlord][:name], :city => params[:landlord][:city], :province => params[:landlord][:province]).first_or_create!
    @landlord.comments.create if @landlord.comments.empty? #add this step
    @landlord.comments[0].setIP request.remote_ip
 
    if @landlord.save     
      flash[:success] = "Thank you for submitting a Landlord"
      redirect_to landlords_path
    else
      flash[:fail] = "Failed to submit landlord"
    end

  end

  def update
  end

  def destroy
  end

end
