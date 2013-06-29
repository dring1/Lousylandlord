class LandlordsController < ApplicationController
  def new
  	@landlord = Landlord.new(:comment => Comment.build)
    #@landlord.comments.build
  end

  def index
    @landlords = Landlord.order(:name).search(params[:search])
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
      @landlord.comments.build
      @landlord.comments.last.setIP request.remote_ip
      @landlord.comments.last.comment = params[:landlord][:comments_attributes]["0"][:comment]
      @landlord.comments.last.terms = params[:landlord][:comments_attributes]["0"][:terms]
    end
    if @landlord.save  
      flash[:success] = "Thank you for bmitting a Landlord "
      redirect_to @landlord
    else
       #flash[:fail] = "Form not filled correctly #{@landlord.errors.count}"
       #@landlord.comments.build
       render landlords_new_path

    end
   end



   def update
   end

   def destroy
   end

 end
