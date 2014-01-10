class Search < ActiveRecord::Base
	def landlords
		@landlord ||= find_landlords
	end

	def addresses
		@addresses ||= find_landlords
	end
private
	def find_landlords
		
	end

	def find_addresses
	end

	def searches_params
		params.require(:search).permit(:name, :province_id, :city_id, :street, :postal, :grade)
	end	
end
