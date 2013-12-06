class RemoveAddressIdFromLandlord < ActiveRecord::Migration
  def change
    remove_column :landlords, :address_id, :int
  end
end
