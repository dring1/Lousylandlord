class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :number
      t.string :street
      t.string :unit
      t.string :postal

      t.timestamps
    end
  end
end
