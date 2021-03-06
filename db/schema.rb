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

ActiveRecord::Schema.define(version: 20170504035213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.index ["group_id"], name: "index_groups_users_on_group_id", using: :btree
    t.index ["user_id"], name: "index_groups_users_on_user_id", using: :btree
  end

  create_table "hangouts", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "locked_out"
  end

  create_table "hangouts_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hangout_id"
    t.index ["hangout_id"], name: "index_hangouts_users_on_hangout_id", using: :btree
    t.index ["user_id"], name: "index_hangouts_users_on_user_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.decimal  "latitude",   precision: 13, scale: 9, null: false
    t.decimal  "longitude",  precision: 13, scale: 9, null: false
    t.integer  "hangout_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
