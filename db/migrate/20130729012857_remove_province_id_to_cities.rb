class RemoveProvinceIdToCities < ActiveRecord::Migration
  def up
    remove_column :cities, :province_id
  end

  def down
    add_column :cities, :province_id, :integer
  end
end
