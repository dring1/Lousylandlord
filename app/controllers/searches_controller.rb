class SearchesController < ApplicationController
	def new
		@search = Search.new
	end



	# def create_landlord_search
	# 	@search = Search.create!(search_params)
	# 	@search.landlords
	# 	if @search.save
	# 		flash[:success] = params[:landlord].present? 

	# 		redirect_to @search
	# 	else

	# 	end
	# end

	# def create_address_search
	# 	@search = Search.create!(search_params)
	# 	@search.addresses
	# 	if @search.save

	# 		redirect_to @search
	# 	else

	# 	end
		
	# end

	def create
		@search = Search.create!(search_params)
		if params[:landlord]
			p "*************** LL CALLED"
			@search.landlords
		else
			p "********** ADDRESS CALLED"
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




	def create_address_search
		
	end

private


	def search_params
		params.require(:search).permit(:name, :province_id, :city_id, :street, :postal, :grade)
	end	


end

