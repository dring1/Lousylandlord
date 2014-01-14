class AddTypeToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :type, :string
  end
end
