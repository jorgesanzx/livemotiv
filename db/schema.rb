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

ActiveRecord::Schema.define(version: 20140402104051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: true do |t|
    t.integer  "young_id"
    t.integer  "experienced_id"
    t.integer  "affinity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "connections", ["experienced_id"], name: "index_connections_on_experienced_id", using: :btree
  add_index "connections", ["young_id"], name: "index_connections_on_young_id", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "nickname"
    t.string   "name"
    t.string   "image"
    t.string   "location"
    t.string   "gender"
    t.integer  "age"
    t.string   "job"
    t.string   "web"
    t.text     "summary"
    t.text     "what_i_look_for"
    t.boolean  "offer_help?"
    t.boolean  "receive_help?"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

end
