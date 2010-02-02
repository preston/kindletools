class CreateDevices < ActiveRecord::Migration
	def self.up
		create_table :devices do |t|
			t.string :serial, :null => false
			t.string :pid, :null => false
			t.string :email, :null => false
			t.timestamps
		end
	end
	
	def self.down
		drop_table :devices
	end
end
