class AddCityIdAndProvinceIdToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :province_id, :integer
    add_column :searches, :city_id, :integer
  end
end
