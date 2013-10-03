class AddCityIdLandlordIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :city_id, :integer
    add_column :addresses, :landlord_id, :integer
  end
end
