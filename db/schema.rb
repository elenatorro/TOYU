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

ActiveRecord::Schema.define(version: 20140821141429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: true do |t|
    t.integer  "project_id"
    t.text     "context"
    t.integer  "duration"
    t.string   "evaluator"
    t.string   "writer"
    t.text     "test"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_images", force: true do |t|
    t.integer  "project_id"
    t.integer  "sorting_test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: true do |t|
    t.integer  "project_id"
    t.integer  "sorting_test_id"
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interviews", force: true do |t|
    t.integer  "project_id"
    t.string   "user_name"
    t.string   "interviwer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.integer  "age"
    t.string   "location"
    t.string   "gender"
    t.text     "education"
    t.text     "hobbies"
    t.text     "description"
    t.text     "tech_level"
    t.text     "goals"
    t.text     "challenges"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.boolean  "confirmed",          default: false
    t.string   "session_token"
  end

  create_table "questions", force: true do |t|
    t.integer  "project_id"
    t.integer  "interview_id"
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requirements", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.boolean  "completed",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenarios", force: true do |t|
    t.integer  "project_id"
    t.integer  "persona_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_requirements", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "requirement1"
    t.text     "requirement2"
    t.text     "requirement3"
    t.text     "requirement4"
    t.text     "requirement5"
    t.text     "requirement6"
    t.text     "requirement7"
    t.text     "requirement8"
    t.text     "requirement9"
    t.text     "requirement10"
  end

  create_table "sorting_tests", force: true do |t|
    t.integer  "project_id"
    t.string   "url"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "project_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "use_cases", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "description"
    t.text     "field_of_application"
    t.text     "actors"
    t.text     "precondition"
    t.text     "trigger"
    t.text     "basic_flow"
    t.text     "alternate_flow"
    t.text     "postcondition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_requirements", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
