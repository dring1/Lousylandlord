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
  end

  def create  	

    other_params = params[:landlord].slice!(:name, :city_id, :province_id)
    @landlord = Landlord.find_or_initialize_by(params[:landlord].permit[:landlord_attribute])

    @landlord.assign_attributes(other_params.permit[:landlord_attribute])
    
    if @landlord.save 
      adr_params = other_params[:address]
      address_params = {landlord_id: @landlord.id, city_id: @landlord.city.id, unit: adr_params[:unit], 
                        number: adr_params[:number], street: adr_params[:street], postal: adr_params[:postal]}
      @a = @landlord.addresses.find_or_initialize_by(address_params) ## EDIT THIS LINE TO CHECK IF ADR ALREADY EXISTS
      @a.save
      flash[:success] = "Thank you for submitting a Landlord " 
      redirect_to @landlord
    else
       render :new
  
    end
   end



   def update
    
    @landlord = Landlord.find(params[:id])
    @c = create_comment(params[:landlord]) unless params[:landlord][:comment][:comment].size < 15
   
    if @landlord.update_attributes(params[:landlord].permit(:landlord_attribute))
      flash[:success] = "Thank you for submitting a comment"
      redirect_to @landlord
    else
      render :show

    end
  end

  def destroy

  end

  def create_comment(options)
    @comment_params = {comment: params[:landlord][:comment][:comment], landlord_id: @landlord.id}
    @comment = @landlord.comments.new(@comment_params)
    @comment.assign_attributes(@comment_params)
    @landlord.comments.last.setIP request.remote_ip
    @comment
  end



end
 
