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

ActiveRecord::Schema.define(version: 20160313215504) do

  create_table "companies", force: :cascade do |t|
    t.string   "cname"
    t.string   "ctype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "order_status"
    t.decimal  "subtotal",     precision: 12, scale: 3
    t.decimal  "tax",          precision: 12, scale: 3
    t.decimal  "shipping",     precision: 12, scale: 3
    t.decimal  "total",        precision: 12, scale: 3
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "pname"
    t.string   "pdescrip"
    t.integer  "pprice"
    t.string   "pcategory"
    t.string   "psubcategory"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id"

  create_table "shipping_details", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "sname"
    t.string   "sphone"
    t.string   "saddress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shipping_details", ["order_id"], name: "index_shipping_details_on_order_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
