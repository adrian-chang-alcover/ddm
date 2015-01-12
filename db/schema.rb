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

ActiveRecord::Schema.define(version: 20150112190034) do

  create_table "careers", force: true do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_id"
  end

  create_table "curriculum_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplines", force: true do |t|
    t.string   "name"
    t.integer  "career_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluation_types", force: true do |t|
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
  end

  create_table "faculties", force: true do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semesters", force: true do |t|
    t.string   "name"
    t.integer  "year_id"
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weeks"
  end

  create_table "study_plans", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.integer  "discipline_id"
    t.integer  "semester_id"
    t.integer  "class_hours"
    t.integer  "evaluation_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "practical_hours"
    t.integer  "curriculum_type_id"
    t.string   "dictum_or_resoluteness"
  end

  create_table "years", force: true do |t|
    t.string   "name"
    t.integer  "career_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "study_plan_id"
  end

end
