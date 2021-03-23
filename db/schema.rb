# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_22_190302) do

  create_table "aeroplanes", force: :cascade do |t|
    t.string "model"
    t.integer "seats_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.string "fullname"
    t.integer "flight_id", null: false
    t.integer "aeroplane_id", null: false
    t.integer "seat_id", null: false
    t.integer "paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aeroplane_id"], name: "index_bookings_on_aeroplane_id"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["seat_id"], name: "index_bookings_on_seat_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "aeroplane_id"
    t.integer "rows"
    t.integer "cols"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aeroplane_id"], name: "index_categories_on_aeroplane_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "aeroplane_id", null: false
    t.string "origin"
    t.string "dist"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aeroplane_id"], name: "index_flights_on_aeroplane_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "flight_id", null: false
    t.integer "category_id", null: false
    t.string "pnr"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "booked"
    t.index ["category_id"], name: "index_seats_on_category_id"
    t.index ["flight_id"], name: "index_seats_on_flight_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "aeroplanes"
  add_foreign_key "bookings", "flights"
  add_foreign_key "bookings", "seats"
  add_foreign_key "flights", "aeroplanes"
  add_foreign_key "seats", "categories"
  add_foreign_key "seats", "flights"
end
