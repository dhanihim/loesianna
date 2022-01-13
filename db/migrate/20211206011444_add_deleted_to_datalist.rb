class AddDeletedToDatalist < ActiveRecord::Migration[6.1]
  def change
      add_column :datalists, :deleted, :integer
      change_column_default( :datalists, :deleted, from: nil, to: false )
  end
end
