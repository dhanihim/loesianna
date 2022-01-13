class AddActivityIdToDatalist < ActiveRecord::Migration[6.1]
  def change
    add_column :datalists, :activity_id, :integer
    add_index :datalists, :activity_id
  end
end
