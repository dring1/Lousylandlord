class LandlordsController < ApplicationController
  def new
  	@landlord = Landlord.new
  end

  def index
    @landlords = Landlord.paginate(page: params[:landlord]).order(:name).search(params[:search])
  end

  def show  	
    @landlord = Landlord.find(params[:id])
    @comment = @landlord.comments.build
    gon.addresses = Address.where(landlord_id: params[:id])
    gon.city_id = Landlord.find(params[:id]).city_id
    gon.city = City.find(gon.city_id).name + ", " + Province.find(City.find(gon.city_id).province_id).name 
  end

  def create  	

    other_params = params[:landlord].slice!(:name, :city_id, :province_id)

    @landlord = Landlord.find_or_initialize_by(params[:landlord].permit(:name, :city_id,:province_id))
    if @landlord.save 
      #adr_params = other_params[:address]
      #address_params = {landlord_id: @landlord.id, city_id: @landlord.city.id, unit: adr_params[:unit], 
      #                  number: adr_params[:number], street: adr_params[:street], postal: adr_params[:postal]}
      #@a = @landlord.addresses.find_or_initialize_by(address_params) ## EDIT THIS LINE TO CHECK IF ADR ALREADY EXISTS
      #retrieve lat + long and save into the params
      #@a.save
      #flash[:success] = "#{address_params} ...\n #{adr_params}  ... \n #{other_params}" 
      flash[:success] = "#{params} #{other_params} #{params[:landlord]}"
      redirect_to @landlord
    else
       render :new
  
    end
   end



   def update
    
    @landlord = Landlord.find(params[:id])

  end

  def destroy
    Landlord.find(params[:id]).destroy
    flash[:success] = "Landlord destroyed."
    redirect_to landlords_url
  end

  def create_comment
    @landlord = Landlord.find(params[:id])
    comment_params = {comment: params[:landlord][:comment][:comment], landlord_id: @landlord.id}
    @comment = @landlord.comments.build
    @comment.assign_attributes(comment_params)
    @comment.setIP request.remote_ip

    if @landlord.save
      redirect_to @landlord
      flash[:success] = "Thank you for submitting a comment"
    else 
      redirect_to @landlord
      flash[:error] = "Comments bust be between 15 and 500 characters! "
    end
  end

  def create_address
    
  end 
private
  def landlord_params
    params.require(:landlord).permit(:name, :city_id, :province_id)
  end
  
  def find_by_params( sname,scity_id,sprovince_id)
    find_params = {name: sname, city_id: scity_id, province_id: sprovince_id}
    Landlord.find_by find_params    
  end 


end
 
