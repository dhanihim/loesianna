class AddPersonalFileIdToClientPersonalFile < ActiveRecord::Migration[6.1]
  def change
    add_column :client_personal_files, :personal_file_id, :integer
    add_index :client_personal_files, :personal_file_id
  end
end
