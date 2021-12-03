class ClientPersonalFile < ApplicationRecord
	belongs_to :client
	belongs_to :personal_file
end
