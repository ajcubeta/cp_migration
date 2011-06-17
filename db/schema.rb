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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110615074126) do

  create_table "users", :force => true do |t|
    t.string   "display_name"
    t.string   "email",                                                                                              :null => false
    t.string   "crypted_password",                                                                                   :null => false
    t.string   "password_salt",                                                                                      :null => false
    t.string   "persistence_token",                                                                                  :null => false
    t.string   "perishable_token",                                                                                   :null => false
    t.integer  "login_count",                                                               :default => 0,           :null => false
    t.integer  "failed_login_count",                                                        :default => 0,           :null => false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "affix"
    t.string   "prefix"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "legal_name"
    t.string   "gender"
    t.integer  "nationality_id"
    t.integer  "birth_place_id"
    t.integer  "permanent_resident_id"
    t.string   "race"
    t.string   "religion"
    t.string   "marital_status"
    t.date     "dob"
    t.datetime "profile_last_updated_at"
    t.decimal  "expected_salary_min",                        :precision => 10, :scale => 2
    t.decimal  "expected_salary_max",                        :precision => 10, :scale => 2
    t.decimal  "current_salary",                             :precision => 10, :scale => 2
    t.string   "availability"
    t.text     "working_location"
    t.boolean  "travel",                                                                    :default => false
    t.boolean  "relocate",                                                                  :default => false
    t.boolean  "shift",                                                                     :default => false
    t.boolean  "tagged",                                                                    :default => false
    t.integer  "legal_identifiers_count",                                                   :default => 0,           :null => false
    t.integer  "addresses_count",                                                           :default => 0,           :null => false
    t.integer  "websites_count",                                                            :default => 0,           :null => false
    t.integer  "educations_count",                                                          :default => 0,           :null => false
    t.integer  "experiences_count",                                                         :default => 0,           :null => false
    t.integer  "competencies_count",                                                        :default => 0,           :null => false
    t.integer  "professional_references_count",                                             :default => 0,           :null => false
    t.integer  "publications_count",                                                        :default => 0,           :null => false
    t.integer  "languages_count",                                                           :default => 0,           :null => false
    t.integer  "job_applications_count",                                                    :default => 0,           :null => false
    t.integer  "job_watch_lists_count",                                                     :default => 0,           :null => false
    t.integer  "job_block_lists_count",                                                     :default => 0,           :null => false
    t.integer  "company_black_lists_count",                                                 :default => 0,           :null => false
    t.string   "status",                                                                    :default => "inactive"
    t.datetime "status_updated_at"
    t.string   "type"
    t.boolean  "staff",                                                                     :default => false
    t.boolean  "admin",                                                                     :default => false
    t.integer  "facebook_uid",                  :limit => 8
    t.boolean  "linkedin_before",                                                           :default => false
    t.string   "linkedin_profile_url"
    t.string   "linkedin_picture_url"
    t.string   "access_token"
    t.string   "access_secret"
    t.boolean  "from_filemaker",                                                            :default => false
    t.integer  "company_id"
    t.integer  "department_id"
    t.string   "designation"
    t.integer  "rating_total",                                                              :default => 0
    t.integer  "rating_count",                                                              :default => 0
    t.string   "timezone",                                                                  :default => "Singapore"
    t.string   "currency_code",                 :limit => 3,                                :default => "SGD"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "home_number"
    t.string   "mobile_number"
    t.string   "work_number"
    t.integer  "highest_education_level_id"
    t.text     "skill_sets"
    t.boolean  "job_alert",                                                                 :default => true
    t.boolean  "notification",                                                              :default => true
    t.boolean  "delta",                                                                     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["birth_place_id"], :name => "index_users_on_birth_place_id"
  add_index "users", ["company_id"], :name => "index_users_on_company_id"
  add_index "users", ["created_at"], :name => "index_users_on_created_at"
  add_index "users", ["delta"], :name => "index_users_on_delta"
  add_index "users", ["department_id"], :name => "index_users_on_department_id"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["facebook_uid"], :name => "index_users_on_facebook_uid"
  add_index "users", ["first_name", "last_name"], :name => "index_users_on_first_name_and_last_name"
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["highest_education_level_id"], :name => "index_users_on_highest_education_level_id"
  add_index "users", ["id", "type"], :name => "index_users_on_id_and_type"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["nationality_id"], :name => "index_users_on_nationality_id"
  add_index "users", ["permanent_resident_id"], :name => "index_users_on_permanent_resident_id"
  add_index "users", ["race"], :name => "index_users_on_race"
  add_index "users", ["religion"], :name => "index_users_on_religion"
  add_index "users", ["staff"], :name => "index_users_on_staff"
  add_index "users", ["status"], :name => "index_users_on_status"
  add_index "users", ["status_updated_at"], :name => "index_users_on_status_updated_at"
  add_index "users", ["tagged"], :name => "index_users_on_tagged"
  add_index "users", ["type"], :name => "index_users_on_type"
  add_index "users", ["updated_at"], :name => "index_users_on_updated_at"

end
