class AddDeletedToPersonalFile < ActiveRecord::Migration[6.1]
  def change
    add_column :personal_files, :deleted, :integer
    change_column_default( :personal_files, :deleted, from: nil, to: false )
  end
end
