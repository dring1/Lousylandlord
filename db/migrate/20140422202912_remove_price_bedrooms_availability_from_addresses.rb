class RemovePriceBedroomsAvailabilityFromAddresses < ActiveRecord::Migration
  def change
  	remove_column :addresses, :price, :int
  	remove_column :addresses, :bedrooms, :int
  	remove_column :addresses, :availability, :boolean
  end
end
