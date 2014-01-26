class AddUserIdToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :user_id, :integer
  end
end
