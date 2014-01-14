class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@search = Search.create!(search_params)
		if params[:landlord]
			@search.landlords
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

private


	def search_params
		params.require(:search).permit(:name, :province_id, :city_id, :street, :postal, :grade)
	end	


end

