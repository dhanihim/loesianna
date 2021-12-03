class AddClientIdToClientPersonalFile < ActiveRecord::Migration[6.1]
  def change
    add_column :client_personal_files, :client_id, :integer
    add_index :client_personal_files, :client_id
  end
end
