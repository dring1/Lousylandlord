class AddressesController < ApplicationController
	def new
		#check pre-existence
		@address = Address.new
	end

	def create
		address_params ={number: params[:address][:number],
						street: params[:address][:street],
						unit: params[:address][:unit],
						postal: 	params[:address][:postal],
						landlord_id: params[:id],
						city_id: params[:city_id]}
		@address = Address.new(address_params)
		if @address.save
			flash[:success] = "Submitted an address successfully"
			redirect_to Landlord.find(params[:id])

		else
			flash[:error] = "Oops, something went wrong submitting the address"
			redirect_to Landlord.find(params[:id])
		end

	end

private
	def address_strong_params(total_params)
		params.require(:address).permit(:number, :street, :unit, :postal)
		params.require(:id)
	end

	#def calc lat  & long  - generate map locations 
	#end



end
