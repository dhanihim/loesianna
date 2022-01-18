class ClientActivityProcesslist < ApplicationRecord
	belongs_to :client_activity
	belongs_to :processlist
end
