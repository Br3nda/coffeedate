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

ActiveRecord::Schema.define(version: 20150225030628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grouping_sets", force: true do |t|
    t.integer  "group_id"
    t.integer  "group_size"
    t.string   "title"
    t.string   "description"
    t.integer  "member_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grouping_sets", ["group_id"], name: "index_grouping_sets_on_group_id", using: :btree

  create_table "groupings", force: true do |t|
    t.integer  "grouping_set_id"
    t.integer  "member1_id"
    t.integer  "member2_id"
    t.integer  "member3_id"
    t.integer  "member4_id"
    t.integer  "member5_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groupings", ["grouping_set_id"], name: "index_groupings_on_grouping_set_id", using: :btree
  add_index "groupings", ["member1_id"], name: "index_groupings_on_member1_id", using: :btree
  add_index "groupings", ["member2_id"], name: "index_groupings_on_member2_id", using: :btree
  add_index "groupings", ["member3_id"], name: "index_groupings_on_member3_id", using: :btree
  add_index "groupings", ["member4_id"], name: "index_groupings_on_member4_id", using: :btree
  add_index "groupings", ["member5_id"], name: "index_groupings_on_member5_id", using: :btree

  create_table "groups", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "members", force: true do |t|
    t.integer  "group_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "refresh_token"
    t.string   "access_token"
    t.datetime "expires"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
