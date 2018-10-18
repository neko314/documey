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

ActiveRecord::Schema.define(version: 2018_09_25_061535) do

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "membership_number"
    t.string "email", null: false
    t.integer "seminar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seminar_id"], name: "index_participants_on_seminar_id"
  end

  create_table "seminars", force: :cascade do |t|
    t.date "date"
    t.time "start_at"
    t.time "finish_at"
    t.string "place"
    t.string "title"
    t.string "theme"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_seminars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "membership_number"
  end

end
