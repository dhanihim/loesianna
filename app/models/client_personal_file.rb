class ClientPersonalFile < ApplicationRecord
	belongs_to :client
	belongs_to :personal_file

	has_one_attached :file
end
