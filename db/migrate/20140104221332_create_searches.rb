class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.string :province
      t.string :city
      t.string :postal
      t.integer :streetnum
      t.integer :grade

      t.timestamps
    end
  end
end
