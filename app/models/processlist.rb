class Processlist < ApplicationRecord
	belongs_to :activity

	has_many :client_activity_processlist
end
