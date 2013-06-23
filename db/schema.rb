# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 5) do

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.boolean  "terms"
    t.string   "ip"
    t.integer  "landlord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["landlord_id", "created_at"], :name => "index_comments_on_landlord_id_and_created_at"

  create_table "landlords", :force => true do |t|
    t.string "name"
    t.string "city"
    t.string "province"
  end

end
