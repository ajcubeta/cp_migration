class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.string :display_name
      t.string :email, :null => false
      t.string :crypted_password, :null => false
      # t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.string :perishable_token, :null => false

      t.integer :login_count, :null => false, :default => 0
      t.integer :failed_login_count, :null => false, :default => 0
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip

      # Person name
      t.string :affix, :prefix
      t.string :first_name, :middle_name, :last_name
      t.string :legal_name

      # Personal information
      t.string :gender
      t.integer :nationality_id, :birth_place_id, :permanent_resident_id
      t.string :race, :religion, :marital_status
      t.date :dob

      t.datetime :profile_last_updated_at

      # Remuneration package
      # Default to per month, if want to view per annual, simply multiply it
      t.decimal :expected_salary_min, :precision => 10, :scale => 2
      t.decimal :expected_salary_max, :precision => 10, :scale => 2
      t.decimal :current_salary, :precision => 10, :scale => 2

      # Availability
      t.string :availability

      # Location
      t.text :working_location
      t.boolean :travel, :default => false
      t.boolean :relocate, :default => false

      # Shift
      t.boolean :shift, :default => false

      # tag
      t.boolean :tagged, :default => false

      # Counters
      t.integer :legal_identifiers_count, :null => false, :default => 0
      t.integer :addresses_count, :null => false, :default => 0
      t.integer :websites_count, :null => false, :default => 0

      t.integer :educations_count, :null => false, :default => 0
      t.integer :experiences_count, :null => false, :default => 0
      t.integer :competencies_count, :null => false, :default => 0
      t.integer :professional_references_count, :null => false, :default => 0
      t.integer :publications_count, :null => false, :default => 0
      t.integer :languages_count, :null => false, :default => 0

      t.integer :job_applications_count, :null => false, :default => 0

      t.integer :job_watch_lists_count, :null => false, :default => 0
      t.integer :job_block_lists_count, :null => false, :default => 0

      t.integer :company_black_lists_count, :null => false, :default => 0

      # AASM
      t.string :status, :default => "inactive"
      t.datetime :status_updated_at

      # STI
      # type=Employer|Consultant|Candidate
      # NOTE: for object removal, only admin will directly remove object, while staff
      # will set a flag for removal only
      t.string :type
      t.boolean :staff, :default => false
      t.boolean :admin, :default => false

      # Facebook
      t.integer :facebook_uid, :limit => 8

      # LinkedIn
      t.boolean :linkedin_before, :default => false
      t.string :linkedin_profile_url
      t.string :linkedin_picture_url
      t.string :access_token
      t.string :access_secret

      # FileMaker migration indicator
      t.boolean :from_filemaker, :default => false

      t.references :company, :department
      t.string :designation

      # Ratings - to calculate, we use rating_total/rating_count = average rating(rounded to 1 decimal)
      t.integer :rating_total, :default => 0
      t.integer :rating_count, :default => 0

      # Timezone
      t.string :timezone, :default => "Singapore"

      # Currency code
      t.string :currency_code, :limit => 3, :default => "SGD" # See http://en.wikipedia.org/wiki/ISO_4217

      # Avatar
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at

      # Resume
      t.string :resume_file_name
      t.string :resume_content_type
      t.integer :resume_file_size
      t.datetime :resume_updated_at

      # Phone numbers
      t.string :home_number
      t.string :mobile_number
      t.string :work_number

      # Highest education level
      t.references :highest_education_level
      t.text :skill_sets

      # Receiving updates
      t.boolean :job_alert, :default => true
      t.boolean :notification, :default => true

      # Sphinx search
      t.boolean :delta, :default => false

      t.timestamps
    end

    add_index :users, :email
    add_index :users, :company_id
    add_index :users, :facebook_uid
    add_index :users, :nationality_id
    add_index :users, :birth_place_id
    add_index :users, :race
    add_index :users, :religion
    add_index :users, :department_id
    add_index :users, :permanent_resident_id
    add_index :users, :highest_education_level_id
    add_index :users, :delta
    add_index :users, :type
    add_index :users, [:id, :type]
    add_index :users, [:first_name, :last_name]
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :status
    add_index :users, :staff
    add_index :users, :admin
    add_index :users, :created_at
    add_index :users, :updated_at
    add_index :users, :status_updated_at
    add_index :users, :tagged
    add_index :users, :reset_password_token, :unique => true
  end

  def self.down
    remove_index :users, :status_updated_at
    remove_index :users, :tagged
    remove_index :users, :type
    remove_index :users, :updated_at
    remove_index :users, :created_at
    remove_index :users, :admin
    remove_index :users, :staff
    remove_index :users, :status
    remove_index :users, :last_name
    remove_index :users, :first_name
    remove_index :users, :column => [:first_name, :last_name]
    remove_index :users, :column => [:id, :type]
    remove_index :users, :delta
    remove_index :users, :highest_education_level_id
    remove_index :users, :permanent_resident_id
    remove_index :users, :department_id
    remove_index :users, :religion
    remove_index :users, :race
    remove_index :users, :birth_place_id
    remove_index :users, :nationality_id
    remove_index :users, :facebook_uid
    remove_index :users, :company_id
    remove_index :users, :email

    drop_table :users
  end
end

# create_table(:users) do |t|
#   t.database_authenticatable :null => false
#   t.recoverable
#   t.rememberable
#   t.trackable
#
#   # t.encryptable
#   # t.confirmable
#   # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
#   # t.token_authenticatable
#
#
#   t.timestamps
# end
#
# add_index :users, :email,                :unique => true
# add_index :users, :reset_password_token, :unique => true
# # add_index :users, :confirmation_token,   :unique => true
# # add_index :users, :unlock_token,         :unique => true
# # add_index :users, :authentication_token, :unique => true


# Best thing to DO: https://github.com/plataformatec/devise
#
# Migrating from other solutions
# Devise implements encryption strategies for Clearance, Authlogic and Restful-Authentication.
# To make use of these strategies, you need set the desired encryptor in the encryptor initializer
# config option and add :encryptable to your model. You might also need to rename your encrypted password
# and salt columns to match Devise’s fields (encrypted_password and password_salt).

# 1. Devise install
# 2. Add necessary attributes from original migration users.rb
# Dump careerpacific_production.sql to PostreSQL cp_migration_development mode
# 3. Create migration to update :crypted_password and other attributes on devise.
# 4. http://developer.postgresql.org/pgdocs/postgres/app-createuser.html

# dropuser postgres
# createuser postgres -p
# role: root
# rake db:create:all
# rake db:migrate

# rvm list
# ruby-1.9.2-head