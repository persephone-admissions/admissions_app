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

ActiveRecord::Schema.define(version: 20151217011953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text    "content"
    t.integer "question_id"
    t.integer "user_id"
    t.integer "application_id"
  end

  add_index "answers", ["application_id"], name: "index_answers_on_application_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "applications", force: :cascade do |t|
    t.text     "notes"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "applications", ["course_id"], name: "index_applications_on_course_id", using: :btree
  add_index "applications", ["user_id"], name: "index_applications_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.date     "start_on"
    t.date     "end_on"
    t.text     "description"
    t.string   "city"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "instructor_id"
    t.integer "officer_id"
  end

  add_index "courses_users", ["course_id"], name: "index_courses_users_on_course_id", using: :btree
  add_index "courses_users", ["instructor_id"], name: "index_courses_users_on_instructor_id", using: :btree
  add_index "courses_users", ["officer_id"], name: "index_courses_users_on_officer_id", using: :btree

  create_table "questionnaires", force: :cascade do |t|
    t.string  "type"
    t.integer "course_id"
  end

  add_index "questionnaires", ["course_id"], name: "index_questionnaires_on_course_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text    "content"
    t.integer "questionnaire_id"
  end

  add_index "questions", ["questionnaire_id"], name: "index_questions_on_questionnaire_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "type"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "answers", "applications"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "applications", "courses"
  add_foreign_key "applications", "users"
  add_foreign_key "questionnaires", "courses"
  add_foreign_key "questions", "questionnaires"
end
