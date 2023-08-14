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

ActiveRecord::Schema[7.0].define(version: 2023_08_14_023441) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clocks", force: :cascade do |t|
    t.uuid "user_id", null: false
    t.boolean "clock_in"
    t.datetime "event_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clocks_on_user_id"
  end

  create_table "employee_categories", force: :cascade do |t|
    t.integer "karyawan_id"
    t.integer "position_id"
  end

  create_table "karyawans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "address"
    t.bigint "position_id", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_karyawans_on_position_id"
    t.index ["user_id"], name: "index_karyawans_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.decimal "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

  add_foreign_key "clocks", "users"
end
