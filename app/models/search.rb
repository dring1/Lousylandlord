class Search < ActiveRecord::Base
	@@access = false

	def landlords
		@@access = true
		@landlord_result ||= find_landlords
	end

	def addresses

		@addresses_result ||= find_addresses
	end

	def ll
		@@access		
	end

private
	def find_landlords
		landlord_result = Landlord.order(:name)
		landlord_result = landlord_result.where("name like ?", "%#{name}%") if name.present?
		# landlord_result = landlord_result.where(province: province) if province.present?
		landlord_result

	end

	def find_addresses
		address_result = Address.order(:street)
		address_result = address_result.where("street like ?", "%#{street}%") if street.present?
		address_result = address_result.where("postal like ?", "%#{postal}") if postal.present?
		address_result
	end


end
