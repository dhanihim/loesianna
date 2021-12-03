class AddDeletedToClient < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :deleted, :integer
    change_column_default( :clients, :deleted, from: nil, to: false )
  end
end
