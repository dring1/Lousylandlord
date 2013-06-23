 class AddLandlordIdToComments < ActiveRecord::Migration
   def change
     add_column :comments, :landlord_id, :int
    

   end
 end
