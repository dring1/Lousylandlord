class RemoveUserIdFromLandlords < ActiveRecord::Migration
  def change
  	remove_column :landlords, :user_id, :int
  end
end
