class LandlordsController < ApplicationController
  def new
  	@landlord = Landlord.new
    #@landlord.comments.build
  end

  def index
    @landlords = Landlord.paginate(page: params[:landlord]).order(:name).search(params[:search])
  end

  def show  	
    @landlord = Landlord.find(params[:id])
  end

  def create  	
    #check if a landlord of the same name already exists and add comments to that
     @landlord = Landlord.where(:name => params[:landlord][:name], \
      :city_id => params[:landlord][:city_id], \
      :province_id => params[:landlord][:province_id]). 
     first_or_create
    #landlord.valid?
    # if @landlord.valid?
    #       @landlord.comments.build      
    #       @landlord.comments.last.setIP request.remote_ip
    #       @landlord.comments.last.comment = params[:landlord][:comments_attributes]["0"][:comment]
    #       @landlord.comments.last.terms = params[:landlord][:comments_attributes]["0"][:terms]
    # end       
    if @landlord.save 
      flash[:success] = "Thank you for submitting a Landlord "
      redirect_to @landlord
    else
       render :new
  
    end
   
    
   end



  #  def update
  #   @landlord = Landlord.find(params[:id])
  #   if @user.update_attributes(params[:user])
  #   else
  #     flash[:notice] = "Creation fail"
  #     render :new
  #   end
  # end

  def destroy
  end



end
 
