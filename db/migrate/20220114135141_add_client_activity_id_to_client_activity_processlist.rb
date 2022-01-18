class AddClientActivityIdToClientActivityProcesslist < ActiveRecord::Migration[6.1]
  def change
    add_column :client_activity_processlists, :client_activity_id, :integer
    add_index :client_activity_processlists, :client_activity_id
  end
end
