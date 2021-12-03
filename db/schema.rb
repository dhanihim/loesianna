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

ActiveRecord::Schema.define(version: 2021_11_06_054339) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "client_activities", force: :cascade do |t|
    t.string "object"
    t.string "associate"
    t.string "assistant"
    t.datetime "activity_expired"
    t.datetime "certificate_expired"
    t.string "serial_number"
    t.string "offline_location"
    t.string "description"
    t.string "status"
    t.integer "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "client_id"
    t.integer "activity_id"
    t.index ["activity_id"], name: "index_client_activities_on_activity_id"
    t.index ["client_id"], name: "index_client_activities_on_client_id"
  end

  create_table "client_personal_files", force: :cascade do |t|
    t.string "link"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "client_id"
    t.integer "personal_file_id"
    t.index ["client_id"], name: "index_client_personal_files_on_client_id"
    t.index ["personal_file_id"], name: "index_client_personal_files_on_personal_file_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.date "birthdate"
    t.string "birthplace"
    t.string "address"
    t.string "phone"
    t.string "status"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city"
    t.integer "deleted", default: 0
    t.string "spouse"
    t.string "spouse_uid"
  end

  create_table "personal_files", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "deleted", default: 0
  end

end
