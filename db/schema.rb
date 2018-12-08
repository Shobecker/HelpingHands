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

ActiveRecord::Schema.define(version: 20181208154001) do

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "vehicle"
    t.string "license"
    t.datetime "birthday"
    t.string "email"
    t.string "address"
    t.string "bankaccount"
    t.string "bankrouting"
    t.string "phone"
    t.string "userName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "worker", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_applicants_on_email", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "address"
    t.string "creditCard"
    t.string "creditExpDate"
    t.integer "securityCode"
    t.string "phone"
    t.string "userName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.text "content"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "ToAdress"
    t.text "FromAddress"
    t.index ["customer_id"], name: "index_jobs_on_customer_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "vehicle"
    t.string "license"
    t.datetime "birthday"
    t.string "email"
    t.string "address"
    t.string "bankaccount"
    t.string "bankrouting"
    t.string "phone"
    t.string "userName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_workers_on_email", unique: true
  end

end
