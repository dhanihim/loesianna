class Client < ApplicationRecord
	has_many :client_personal_file
	has_many :client_activity
end
