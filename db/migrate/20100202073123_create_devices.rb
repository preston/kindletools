class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string :serial
      t.string :pid

      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
