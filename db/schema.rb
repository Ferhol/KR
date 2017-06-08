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

ActiveRecord::Schema.define(version: 20170501085108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.text     "mark",          null: false
    t.text     "class_c",       null: false
    t.text     "license_plate", null: false
    t.text     "color",         null: false
    t.integer  "year_of_issue", null: false
    t.integer  "driver1_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["driver1_id"], name: "index_cars_on_driver1_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "driver1s", force: :cascade do |t|
    t.text     "fn",         null: false
    t.text     "sn",         null: false
    t.text     "ln"
    t.date     "birthday",   null: false
    t.integer  "inn",        null: false
    t.integer  "series_p",   null: false
    t.integer  "number_p",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inn"], name: "index_driver1s_on_inn", unique: true, using: :btree
    t.index ["number_p"], name: "index_driver1s_on_number_p", unique: true, using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.date     "date_o",       null: false
    t.time     "time_o",       null: false
    t.text     "address_o",    null: false
    t.text     "address_p",    null: false
    t.integer  "number_p",     null: false
    t.float    "route_length", null: false
    t.integer  "driver1_id"
    t.integer  "rate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["driver1_id"], name: "index_orders_on_driver1_id", using: :btree
    t.index ["rate_id"], name: "index_orders_on_rate_id", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.text     "name_r",       null: false
    t.text     "times_of_day", null: false
    t.text     "range",        null: false
    t.float    "price",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["name_r"], name: "index_rates_on_name_r", unique: true, using: :btree
  end

  create_table "role_users", force: :cascade do |t|
    t.integer  "role_id",    null: false
    t.integer  "user_id",    null: false
    t.json     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_role_users_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "info",       null: false
    t.text     "full_info",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["info"], name: "index_roles_on_info", unique: true, using: :btree
    t.index ["name"], name: "index_roles_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.date     "birthday"
    t.index ["activation_token"], name: "index_users_on_activation_token", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "cars", "driver1s"
  add_foreign_key "orders", "driver1s"
  add_foreign_key "orders", "rates"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
end
