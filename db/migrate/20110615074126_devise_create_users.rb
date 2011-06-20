class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :crypted_password, :encrypted_password
    add_column :users, :remember_token, :string
    add_column :users, :reset_password_token, :string
    add_column :users, :remember_created_at, :datetime
    add_column :users, :sign_in_count, :integer
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string

    add_index :users, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end

# add_column :users, :encrypted_password, :string

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