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

ActiveRecord::Schema.define(version: 20150508200708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_changes", force: true do |t|
    t.integer  "game_id",      null: false
    t.integer  "game_version", null: false
    t.string   "action",       null: false
    t.integer  "play_id"
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "token",                     null: false
    t.integer  "events_count"
    t.integer  "stories_count"
    t.integer  "users_count"
    t.integer  "lock_version",  default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["token"], name: "index_games_on_token", unique: true, using: :btree

  create_table "plays", force: true do |t|
    t.integer  "story_id",                           null: false
    t.integer  "user_id",                            null: false
    t.decimal  "value",      precision: 5, scale: 3, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name",                          null: false
  end

  add_index "plays", ["story_id"], name: "index_plays_on_story_id", using: :btree
  add_index "plays", ["user_id", "story_id"], name: "index_plays_on_user_id_and_story_id", unique: true, using: :btree

  create_table "stories", force: true do |t|
    t.integer  "game_id",                      null: false
    t.string   "description",                  null: false
    t.boolean  "complete",     default: false, null: false
    t.integer  "lock_version", default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed_at"
  end

  add_index "stories", ["game_id", "description"], name: "index_stories_on_game_id_and_description", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.integer  "game_id",                      null: false
    t.string   "name",                         null: false
    t.integer  "lock_version", default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "observer",     default: false, null: false
  end

  add_index "users", ["game_id", "name"], name: "index_users_on_game_id_and_name", unique: true, using: :btree

end
