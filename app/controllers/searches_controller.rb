class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@search = Search.create!(search_params)
		if params[:landlord]
			@search.landlords
		elsif params[:map_button] && !params[:search][:city_id].blank?
	      gon.city_id = params[:search][:city_id]
	      gon.addresses = Address.where(city_id: gon.city_id)
	      gon.city = City.find(gon.city_id).name + ", " + Province.find(City.find(gon.city_id).province_id).name 
	      gon.landlords = Landlord.where(city_id: gon.city_id)
	      render :citymap
	      return
		else
			@search.addresses
		end
		if @search.save 
			redirect_to @search
		else

		end
	end

	def show
		@search = Search.find(params[:id])
	end

	def citymap
	end

private


	def search_params
		params.require(:search).permit(:name, :province_id, :city_id, :street, :postal, :grade)
	end	


end

