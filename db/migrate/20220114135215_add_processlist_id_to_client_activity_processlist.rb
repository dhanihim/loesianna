class AddProcesslistIdToClientActivityProcesslist < ActiveRecord::Migration[6.1]
  def change
    add_column :client_activity_processlists, :processlist_id, :integer
    add_index :client_activity_processlists, :processlist_id
  end
end
