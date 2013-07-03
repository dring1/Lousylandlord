class LandlordsController < ApplicationController
  def new
  	@landlord = Landlord.new
    @landlord.comments.build
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
     :city => params[:landlord][:city], \
     :province => params[:landlord][:province]). 
    first_or_create
    if @landlord.valid?
      #refactor this shit
        # if validComment? params[:landlord][:comments_attributes]["0"][:comment]  && 
        #   params[:landlord][:comments_attributes]["0"][:terms]
          @landlord.comments.build      
          @landlord.comments.last.setIP request.remote_ip
          @landlord.comments.last.comment = params[:landlord][:comments_attributes]["0"][:comment]
          @landlord.comments.last.terms = params[:landlord][:comments_attributes]["0"][:terms]
        # end
    end
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

  def validComment? comment
    (comment.length < 15 || comment.length > 500) ? false : true
  end

end
 
