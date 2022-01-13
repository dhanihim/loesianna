class ClientActivity < ApplicationRecord
	belongs_to :client
	belongs_to :activity

	has_many :client_activity_datalist
end
