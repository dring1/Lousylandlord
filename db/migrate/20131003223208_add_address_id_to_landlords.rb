class AddAddressIdToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :address_id, :integer
  end
end
