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

ActiveRecord::Schema.define(version: 20171108070701) do

  create_table "calls", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "representative_id"
    t.integer  "user_id"
  end

  add_index "calls", ["representative_id"], name: "index_calls_on_representative_id"
  add_index "calls", ["user_id"], name: "index_calls_on_user_id"

  create_table "counties", force: :cascade do |t|
    t.string   "name",                           null: false
    t.integer  "states_id"
    t.string   "activity",   default: "neutral"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "representatives", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "phone_number"
    t.string   "state"
    t.string   "city"
    t.string   "interests"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "activity",   default: "neutral"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "symbol"
  end

  create_table "users", force: :cascade do |t|
    t.string   "interests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "uid"
    t.string   "name"
    t.string   "provider"
  end

end
