class Landlords < ActiveRecord::Migration
  def up
  	create_table 'landlords' do |t|
  		t.string :name
  		t.string :city
  		t.string :province
  	end
  end

  def down
  	drop_table 'landlords'
  end
end
