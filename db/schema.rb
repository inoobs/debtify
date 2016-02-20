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

ActiveRecord::Schema.define(version: 20160220170145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payable_items", force: :cascade do |t|
    t.integer  "payable_id"
    t.date     "due_on"
    t.datetime "paid_at"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payable_id"], name: "index_payable_items_on_payable_id", using: :btree
  end

  create_table "payables", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.string   "recurring_type"
    t.date     "recurring_ends_on"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["recurring_type"], name: "index_payables_on_recurring_type", using: :btree
    t.index ["user_id"], name: "index_payables_on_user_id", using: :btree
  end

  create_table "plugins", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plugins_users", force: :cascade do |t|
    t.integer  "plugin_id"
    t.integer  "user_id"
    t.json     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plugin_id"], name: "index_plugins_users_on_plugin_id", using: :btree
    t.index ["user_id"], name: "index_plugins_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
