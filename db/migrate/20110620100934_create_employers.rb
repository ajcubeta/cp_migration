class CreateEmployers < ActiveRecord::Migration
  def self.up
    create_table :employers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :employers
  end
end
