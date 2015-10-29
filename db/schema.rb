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

ActiveRecord::Schema.define(version: 20151029012921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "domains", force: :cascade do |t|
    t.string   "name"
    t.boolean  "lock",         default: true
    t.boolean  "privacy",      default: true
    t.string   "epp"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "registration"
    t.datetime "expiry"
    t.boolean  "autorenew"
  end

  create_table "glues", force: :cascade do |t|
    t.string "name"
    t.string "ipv4"
    t.string "ipv6"
  end

  create_table "nameservers", force: :cascade do |t|
    t.string  "name"
    t.integer "order"
    t.string  "ip_address"
    t.integer "domain_id"
  end

  add_index "nameservers", ["domain_id"], name: "index_nameservers_on_domain_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.string  "organization"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "address1"
    t.string  "address2"
    t.string  "address3"
    t.string  "city"
    t.string  "state"
    t.string  "country"
    t.string  "postal_code"
    t.string  "email"
    t.string  "phone_number"
    t.string  "type"
    t.integer "domain_id"
  end

  add_index "registrations", ["domain_id"], name: "index_registrations_on_domain_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "nameservers", "domains"
  add_foreign_key "registrations", "domains"
end
