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

ActiveRecord::Schema[7.1].define(version: 2024_01_23_215401) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "job_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "job_position_id"
    t.string "event_type", null: false
    t.string "contact_name"
    t.string "contact_info"
    t.datetime "occurred_at"
    t.index ["event_type"], name: "index_job_events_on_event_type"
    t.index ["job_position_id"], name: "index_job_events_on_job_position_id"
    t.index ["occurred_at"], name: "index_job_events_on_occurred_at"
  end

  create_table "job_positions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "job_link"
    t.uuid "company_id"
    t.string "status"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain"
    t.datetime "posted_on"
    t.decimal "interest_level", precision: 5, scale: 2
    t.index ["company_id"], name: "index_job_positions_on_company_id"
    t.index ["interest_level"], name: "index_job_positions_on_interest_level"
    t.index ["status"], name: "index_job_positions_on_status"
  end

end
