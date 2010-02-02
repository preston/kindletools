require 'kindle-drm'

class WelcomeController < ApplicationController

	include Kindle::DRM

	def calculate_pid
		@serial = params[:device][:serial]
		@type, @size, @pad = serialToDeviceTypeAndPidSize(@serial)
		if @type.nil?
			render	'bad', :layout => false
		else
			@device = Device.new
			@device.email = (params[:device][:email] || "")
			@device.serial = @serial
			@device.pid = serialToPid(@device.serial)
			@device.save!
			render	'good', :layout => false
		end
	end

end
