class AddClientIdToClientActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :client_activities, :client_id, :integer
    add_index :client_activities, :client_id
  end
end
