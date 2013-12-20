class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :landlord_id
    	t.string :comment
    	t.string :ip
    	t.timestamp

    end
  end
end
