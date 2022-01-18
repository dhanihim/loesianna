class Activity < ApplicationRecord
	has_many :client_activity
	has_many :datalist
	has_many :processlist
end
