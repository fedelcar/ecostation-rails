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

ActiveRecord::Schema.define(version: 20151022023128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "legal_name",   null: false
    t.string   "fantasy_name", null: false
    t.string   "cuit",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "positions", force: :cascade do |t|
    t.float    "lat",         default: 0.0, null: false
    t.float    "lng",         default: 0.0, null: false
    t.date     "date"
    t.string   "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "station_id"
  end

  create_table "prizes", force: :cascade do |t|
    t.string   "name",        default: "Premio Genérico", null: false
    t.string   "description"
    t.integer  "bottles",                                 null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "company_id",                              null: false
  end

  create_table "stations", force: :cascade do |t|
    t.integer  "company_id",                null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",       default: "NN", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.date     "date"
    t.integer  "user_id",    null: false
    t.integer  "prize_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "bottles",    default: 1, null: false
    t.datetime "time"
    t.integer  "station_id",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "dni"
    t.integer  "bottles",                default: 0,  null: false
    t.string   "rfid"
    t.integer  "company_id"
    t.boolean  "site_admin"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
