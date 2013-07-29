class RemoveProvinceFromCities < ActiveRecord::Migration
  def up
    remove_column :cities, :province
  end

  def down
    add_column :cities, :province, :string
  end
end
