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

ActiveRecord::Schema.define(version: 20180308095430) do

  create_table "file_keys", force: :cascade do |t|
    t.string "file_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_keys_resources", id: false, force: :cascade do |t|
    t.integer "resources_id"
    t.integer "file_keys_id"
    t.index ["file_keys_id"], name: "index_file_keys_resources_on_file_keys_id"
    t.index ["resources_id"], name: "index_file_keys_resources_on_resources_id"
  end

  create_table "resources", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.integer "user_id"
    t.string "resource_type"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nick_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
