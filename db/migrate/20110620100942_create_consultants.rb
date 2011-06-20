class CreateConsultants < ActiveRecord::Migration
  def self.up
    create_table :consultants do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :consultants
  end
end
