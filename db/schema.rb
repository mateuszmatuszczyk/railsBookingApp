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

ActiveRecord::Schema.define(version: 2019_04_03_042641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.time "appointment_time", null: false
    t.date "appointment_date", null: false
    t.integer "appointment_duration", default: 0, null: false
    t.decimal "total_cost", default: "0.0", null: false
    t.string "status", default: "active", null: false
    t.bigint "customer_id"
    t.bigint "barber_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barber_id"], name: "index_appointments_on_barber_id"
    t.index ["customer_id"], name: "index_appointments_on_customer_id"
  end

  create_table "barbers", force: :cascade do |t|
    t.string "barber_name", default: "", null: false
    t.string "barber_bio", default: "Barber's bio...", null: false
    t.string "barber_photo_path", default: "blank", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_name", default: "", null: false
    t.string "customer_number", default: "", null: false
    t.string "customer_photo_path", default: "blank", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "service_name", default: "", null: false
    t.string "service_description", default: "", null: false
    t.integer "service_duration", default: 0, null: false
    t.decimal "service_price", default: "0.0", null: false
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_services_on_appointment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "barbers"
  add_foreign_key "appointments", "customers"
  add_foreign_key "customers", "users"
  add_foreign_key "services", "appointments"
end
