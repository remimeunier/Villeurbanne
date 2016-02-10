class Vendor < ActiveRecord::Base
	has_one :user
	geocoded_by :address   # can also be an IP address
	after_validation :geocode
end
