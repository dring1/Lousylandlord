 class AddIndexes < ActiveRecord::Migration
  def up
  	add_index :comments, [:landlord_id, :created_at]
  end

  def down
  end
 end
