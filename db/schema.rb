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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140503143221) do

  create_table "addresses", force: true do |t|
    t.string   "number"
    t.string   "street"
    t.string   "unit"
    t.string   "postal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "landlord_id"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "province_id"
  end

  create_table "cities", force: true do |t|
    t.string  "name"
    t.integer "province_id"
  end

  create_table "comments", force: true do |t|
    t.integer  "landlord_id"
    t.string   "comment"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "landlords", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: true do |t|
    t.string   "name"
    t.string   "province"
    t.string   "city"
    t.string   "postal"
    t.integer  "streetnum"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street"
    t.string   "type"
    t.integer  "province_id"
    t.integer  "city_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
