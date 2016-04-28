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

ActiveRecord::Schema.define(version: 20160428164447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.integer  "stage",       default: 1
    t.string   "title",                   null: false
    t.text     "description",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "vacant_id",               null: false
  end

  add_index "projects", ["vacant_id"], name: "index_projects_on_vacant_id", using: :btree

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "project_id", null: false
  end

  create_table "support_tickets", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.boolean  "reviewed",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string  "firstname",       limit: 255
    t.string  "lastname",        limit: 255
    t.boolean "isadmin",                     default: false, null: false
    t.boolean "isvolunteer",                 default: false, null: false
    t.string  "email",                                       null: false
    t.string  "password_digest"
    t.boolean "email_confirmed",             default: false
    t.string  "confirm_token"
    t.string  "username",                                    null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vacants", force: :cascade do |t|
    t.string  "full_address"
    t.string  "block"
    t.string  "lot"
    t.string  "zip_code"
    t.string  "city"
    t.string  "neighborhood"
    t.string  "police_district"
    t.integer "council_district"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string  "owner"
    t.string  "use"
    t.string  "mailing_address"
  end

  add_foreign_key "projects", "vacants"
end
