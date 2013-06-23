class Comments < ActiveRecord::Migration
  def up
  	create_table 'comments' do |t|
  		t.text :comment
  		t.boolean :terms
  		t.string :ip
  	end

  end

  def down
  	drop_table 'comments'
  end
end
