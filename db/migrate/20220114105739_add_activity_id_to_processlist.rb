class AddActivityIdToProcesslist < ActiveRecord::Migration[6.1]
  def change
    add_column :processlists, :activity_id, :integer
    add_index :processlists, :activity_id
  end
end
