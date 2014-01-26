class AddPriceBedroomsAvailabilityToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :price, :integer
    add_column :addresses, :bedrooms, :integer
    add_column :addresses, :availability, :boolean, default: false
  end
end
