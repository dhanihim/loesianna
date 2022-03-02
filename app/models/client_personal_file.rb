class ClientPersonalFile < ApplicationRecord
	belongs_to :client
	belongs_to :personal_file

	has_one_attached :file

	after_create :set_filename
  	after_update :set_filename

	def set_filename
		if self.file.attached?
	  		self.file.blob.update(filename: "#{self.personal_file.name}_#{self.client.name}.#{self.file.filename.extension}")
		end
	end
end
