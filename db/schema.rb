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

ActiveRecord::Schema.define(version: 2021_04_12_040624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payment_methods", force: :cascade do |t|
    t.integer "payment_source_id"
    t.string "status"
    t.string "method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "rider_id"
    t.string "status"
    t.string "start_address"
    t.string "destination_address"
    t.datetime "date_initial"
    t.datetime "date_final"
    t.float "distance"
    t.float "duration"
    t.float "base_feet"
    t.float "total_amount"
    t.string "payment_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "rider_id"
    t.integer "ride_id"
    t.string "status"
    t.float "total_amount"
    t.datetime "date"
    t.string "payment_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "status"
    t.string "license_plate"
    t.string "payment_method"
    t.string "type"
    t.string "token"
    t.string "acceptance_token"
    t.integer "payment_method_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
