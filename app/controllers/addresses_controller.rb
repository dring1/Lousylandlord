class AddressesController < ApplicationController
	def new
		#check pre-existence
		@address = Address.new
	end

	def create
		redirect_to root_path
	end


end
