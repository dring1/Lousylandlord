class LandlordsController < ApplicationController
  def new
  	@landlord = Landlord.new
    @comment = Comment.build
  end

  def index
    @landlords = Landlord.paginate(page: params[:landlord]).order(:name).search(params[:search])
  end

  def show  	
    @landlord = Landlord.find(params[:id])
    @comment  = Comment.new
  end

  def create  	
    #check if a landlord of the same name already exists and add comments to that
     @landlord = Landlord.where(:name => params[:landlord][:name], \
      :city_id => params[:landlord][:city_id], \
      :province_id => params[:landlord][:province_id]). 
     first_or_create
    if @landlord.save 
      flash[:success] = "Thank you for submitting a Landlord " 
      redirect_to @landlord
    else
       render :new
  
    end
   
    
   end



   def update
    
    @landlord = Landlord.find(params[:id])
    @comment = Comment.new
    if @landlord.comments.build(params[:landlord][:comment]) 
      @landlord.comments.last.setIP request.remote_ip
    end
    if @landlord.update_attributes(params[:user])
        flash[:success] = params[:landlord] 
        redirect_to @landlord
    else

      render :show

    end
  end

  def destroy
  end



end
 
