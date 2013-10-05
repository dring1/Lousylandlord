class LandlordsController < ApplicationController
  def new
  	@landlord = Landlord.new
  end

  def index
    @landlords = Landlord.paginate(page: params[:landlord]).order(:name).search(params[:search])
  end

  def show  	
    @landlord = Landlord.find(params[:id])
    @comment  = Comment.new
  end

  def create  	

    other_params = params[:landlord].slice!(:name, :city_id, :province_id)
    @landlord = Landlord.find_or_initialize_by(params[:landlord].permit[:landlord_attribute])

    @landlord.assign_attributes(other_params.permit[:landlord_attribute])
    
    if @landlord.save 
      adr_params = other_params[:address]
      address_params = {landlord_id: @landlord.id, city_id: @landlord.city.id, unit: adr_params[:unit], 
                        number: adr_params[:number], street: adr_params[:street], postal: adr_params[:postal]}
      @a = @landlord.addresses.build(address_params)
    

      flash[:success] = " #{@a.save}.... #{@a.attributes}.. #{address_params} " #"Thank you for submitting a Landlord " 
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
 
