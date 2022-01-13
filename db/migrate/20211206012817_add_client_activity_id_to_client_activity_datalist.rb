class AddClientActivityIdToClientActivityDatalist < ActiveRecord::Migration[6.1]
  def change
    add_column :client_activity_datalists, :client_activity_id, :integer
    add_index :client_activity_datalists, :client_activity_id
  end
end
