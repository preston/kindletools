class Device < ActiveRecord::Base
	
	validates_presence_of	:serial
	validates_presence_of	:pid
	# validates_presence_of	:email

end
