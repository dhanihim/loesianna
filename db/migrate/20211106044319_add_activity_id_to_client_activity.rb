class AddActivityIdToClientActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :client_activities, :activity_id, :integer
    add_index :client_activities, :activity_id
  end
end
