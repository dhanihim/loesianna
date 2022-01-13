class AddDatalistIdToClientActivityDatalist < ActiveRecord::Migration[6.1]
  def change
    add_column :client_activity_datalists, :datalist_id, :integer
    add_index :client_activity_datalists, :datalist_id
  end
end
