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

ActiveRecord::Schema.define(version: 20150407115340) do

  create_table "api_keys", force: true do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.string   "scope"
    t.datetime "expired_at"
    t.datetime "created_at"
  end

  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id"

  create_table "clickers", force: true do |t|
    t.string   "command"
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clickers", ["device_id"], name: "index_clickers_on_device_id"
  add_index "clickers", ["room_id"], name: "index_clickers_on_room_id"
  add_index "clickers", ["user_id"], name: "index_clickers_on_user_id"

  create_table "devices", id: false, force: true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.string   "device_id",  null: false
    t.string   "status"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "devices", ["device_id"], name: "index_devices_on_device_id", unique: true
  add_index "devices", ["room_id"], name: "index_devices_on_room_id"
  add_index "devices", ["user_id"], name: "index_devices_on_user_id"

  create_table "notes", force: true do |t|
    t.text     "body"
    t.integer  "device_id"
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["device_id"], name: "index_notes_on_device_id"
  add_index "notes", ["room_id"], name: "index_notes_on_room_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "rooms", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "rooms", ["name"], name: "index_rooms_on_name", unique: true
  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id"

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

end
