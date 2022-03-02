class ClientActivityDatalist < ApplicationRecord
	belongs_to :datalist
	belongs_to :client_activity

	has_one_attached :file

	after_create :set_filename
  	after_update :set_filename

	def set_filename
		if self.file.attached?
	  		self.file.blob.update(filename: "#{self.datalist.name}_#{self.client_activity.client.name}.#{self.file.filename.extension}")
		end
	end
end
