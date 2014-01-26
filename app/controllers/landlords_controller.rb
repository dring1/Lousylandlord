class LandlordsController < ApplicationController
  def new
  	@landlord = Landlord.new
  end

  def index
    @landlords = Landlord.paginate(page: params[:landlord]).order(:name).search(params[:search])
  end

  def show  	
    @landlord = Landlord.find(params[:id])
    gon.addresses = Address.where(landlord_id: params[:id])
    gon.city_id = Landlord.find(params[:id]).city_id
    gon.landlords = Landlord.where(city_id: gon.city_id)
    gon.city = City.find(gon.city_id).name + ", " + Province.find(City.find(gon.city_id).province_id).name 
  end

  def create  	

    other_params = params[:landlord].slice!(:name, :city_id, :province_id, :user, :user_id)
    # check if the landlord checkbox is checked
    if params[:landlord][:user] == '1'
      @landlord = Landlord.find_or_initialize_by(params[:landlord].permit(:name, :city_id, :province_id, :user_id))
    elsif
      @landlord = Landlord.find_or_initialize_by(params[:landlord].permit(:name, :city_id, :province_id))
    end
    if @landlord.save 
      flash[:success] = "Thank you for submitting a landlord"
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


private
  def landlord_params
    params.require(:landlord).permit(:name, :city_id, :province_id)
  end
  
  def find_by_params( sname,scity_id,sprovince_id)
    find_params = {name: sname, city_id: scity_id, province_id: sprovince_id}
    Landlord.find_by find_params    
  end 


end
 
