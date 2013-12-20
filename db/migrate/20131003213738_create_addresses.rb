class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :number
      t.string :street
      t.string :unit
      t.string :postal

      t.timestamps
    end
    create_table "landlords" do |t|
	    t.string   "name"
	    t.integer  "city_id"
	    t.integer  "province_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
 	 end
  end
end
