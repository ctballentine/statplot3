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

ActiveRecord::Schema.define(version: 20191129191004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datapoints", id: :serial, force: :cascade do |t|
    t.integer "event"
    t.string "parameter", limit: 255
    t.float "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "experiment_id"
  end

  create_table "experiments", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "fcsfile", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "team_id"
  end

  create_table "keynames", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "experiment_id"
  end

  create_table "members", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "interest", limit: 255
    t.string "location", limit: 255
    t.string "email", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "team_id"
  end

  create_table "smples", force: :cascade do |t|
    t.float "par1"
    t.float "par2"
    t.string "grp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "affiliation", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
