class Activity < ApplicationRecord
	has_many :client_activity
	has_many :datalist
end
