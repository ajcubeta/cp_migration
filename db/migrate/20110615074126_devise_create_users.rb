class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
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
# 4. Ask RH :)
