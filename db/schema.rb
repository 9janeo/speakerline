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

ActiveRecord::Schema.define(version: 2017_12_09_171303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_instances", id: :serial, force: :cascade do |t|
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.index ["event_id"], name: "index_event_instances_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_events_on_name", unique: true
  end

  create_table "proposals", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "speaker_id"
    t.index ["speaker_id"], name: "index_proposals_on_speaker_id"
  end

  create_table "speakers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", id: :serial, force: :cascade do |t|
    t.integer "result"
    t.integer "proposal_id"
    t.integer "event_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_instance_id"], name: "index_submissions_on_event_instance_id"
    t.index ["proposal_id"], name: "index_submissions_on_proposal_id"
  end

  add_foreign_key "event_instances", "events"
  add_foreign_key "proposals", "speakers"
  add_foreign_key "submissions", "event_instances"
  add_foreign_key "submissions", "proposals"
end
