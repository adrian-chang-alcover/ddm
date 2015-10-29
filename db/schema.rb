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

ActiveRecord::Schema.define(version: 20151029144726) do

  create_table "accreditation_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "career_accreditations", force: true do |t|
    t.integer  "career_id"
    t.integer  "university_id"
    t.integer  "year"
    t.integer  "accreditation_category_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "careers", force: true do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_id"
    t.integer  "study_modality_id"
    t.boolean  "headquarters"
  end

  create_table "careers_universities", force: true do |t|
    t.integer "career_id"
    t.integer "university_id"
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
    t.integer  "number",     default: 0
  end

  create_table "dynamic_news", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
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
    t.string   "dean"
    t.integer  "university_id"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locals", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rm_repo_items", force: true do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.integer "sender_id"
    t.string  "sender_type"
    t.string  "ancestry"
    t.integer "ancestry_depth", default: 0
    t.string  "name"
    t.float   "file_size"
    t.string  "content_type"
    t.string  "file"
    t.string  "type"
    t.string  "checksum"
  end

  add_index "rm_repo_items", ["owner_id", "owner_type"], name: "index_rm_repo_items_on_owner_id_and_owner_type"
  add_index "rm_repo_items", ["sender_id", "sender_type"], name: "index_rm_repo_items_on_sender_id_and_sender_type"

  create_table "rm_sharings", force: true do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.integer "creator_id"
    t.string  "creator_type"
    t.integer "repo_item_id"
    t.boolean "can_create",   default: false
    t.boolean "can_read",     default: false
    t.boolean "can_update",   default: false
    t.boolean "can_delete",   default: false
    t.boolean "can_share",    default: false
  end

  add_index "rm_sharings", ["creator_id", "creator_type"], name: "index_rm_sharings_on_creator_id_and_creator_type"
  add_index "rm_sharings", ["owner_id", "owner_type"], name: "index_rm_sharings_on_owner_id_and_owner_type"
  add_index "rm_sharings", ["repo_item_id"], name: "index_rm_sharings_on_repo_item_id"

  create_table "rm_sharings_members", force: true do |t|
    t.integer "sharing_id"
    t.integer "member_id"
    t.string  "member_type"
    t.boolean "can_add",     default: false
    t.boolean "can_remove",  default: false
  end

  add_index "rm_sharings_members", ["member_id", "member_type"], name: "index_rm_sharings_members_on_member_id_and_member_type"
  add_index "rm_sharings_members", ["sharing_id"], name: "index_rm_sharings_members_on_sharing_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
  end

  create_table "roles_users", force: true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_activities", force: true do |t|
    t.integer  "professor_id"
    t.integer  "subject_id"
    t.integer  "group_id"
    t.integer  "local_id"
    t.integer  "docent_day_id"
    t.integer  "turn_id"
    t.integer  "turn_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_distributions", force: true do |t|
    t.integer  "professor_id"
    t.integer  "group_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_docent_categories", force: true do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_docent_days", force: true do |t|
    t.date     "day"
    t.integer  "docent_week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_docent_weeks", force: true do |t|
    t.integer  "number"
    t.date     "first_day"
    t.integer  "year_id"
    t.integer  "semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_groups", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_locals", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_p1s", force: true do |t|
    t.integer  "subject_id"
    t.integer  "docent_week_id"
    t.integer  "turn_type_id"
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_professors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "scientific_degree_id"
    t.integer  "docent_category_id"
    t.integer  "faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_scientific_degrees", force: true do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_turn_types", force: true do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_turns", force: true do |t|
    t.string   "name"
    t.time     "start_time"
    t.time     "end_time"
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

  create_table "study_modalities", force: true do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "class_hours_1",          default: 0
    t.integer  "evaluation_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "practical_hours",        default: 0
    t.integer  "curriculum_type_id"
    t.string   "dictum_or_resoluteness"
    t.integer  "number",                 default: 0
    t.integer  "class_hours_2",          default: 0
  end

  create_table "tasks_management_tasks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "priority"
    t.integer  "state"
    t.integer  "parent_id"
    t.integer  "owner_id"
    t.integer  "requester_id"
    t.date     "end_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "turn_types", force: true do |t|
    t.string   "full_name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turns", force: true do |t|
    t.string   "name"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: true do |t|
    t.string "short_name"
    t.string "full_name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "faculty_id"
    t.integer  "career_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

  create_table "visit_counters", force: true do |t|
    t.string   "user_id"
    t.string   "ip"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "years", force: true do |t|
    t.string   "name"
    t.integer  "career_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "study_plan_id"
  end

end
