class Datalist < ApplicationRecord
	belongs_to :activity
	has_many :client_activity_datalist
end
