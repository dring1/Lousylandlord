class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@search = Search.create!(search_params)
		redirect_to @search
	end

	def create_landlord_search
	end

	def create_address_search
		
	end

private
	def search_landlords
		landlords = Landlord.order(:name)
		landlords = landlords.where("name like ?", "%#{name}%") if name.present?
	end

	def search_addreses
		
	end

	def search_params
		params.require(:search).permit(:name, :province_id, :city_id, :street, :postal, :grade)
	end	


end

