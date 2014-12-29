require 'test_helper'

class DeviceTest < ActiveSupport::TestCase

	setup do
		@d1 = devices(:device_1)
	end


	test "fixture data is valid" do
		assert @d1.valid?
	end

end
