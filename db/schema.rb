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

ActiveRecord::Schema.define(version: 20170315061636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "name"
    t.text     "location"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time     "time"
    t.string   "image_url"
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "requestor_id"
    t.integer  "standin_id"
    t.integer  "event_id"
    t.float    "cost"
    t.text     "description"
    t.text     "status"
    t.text     "delivery_arrangement"
    t.text     "image_url"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["event_id"], name: "index_requests_on_event_id", using: :btree
    t.index ["requestor_id"], name: "index_users_on_requestor_id", using: :btree
    t.index ["standin_id"], name: "index_users_on_standin_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "request_id"
    t.string   "paymentgateway_id"
    t.float    "amount_paid"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["request_id"], name: "index_transactions_on_request_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "contact",                default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "is_Admin",               default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "events", "users"
  add_foreign_key "requests", "events"
  add_foreign_key "transactions", "requests"
end
