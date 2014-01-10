class AddStreetToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :street, :string
  end
end
