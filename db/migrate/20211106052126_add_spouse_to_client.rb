class AddSpouseToClient < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :spouse, :string
    add_column :clients, :spouse_uid, :string
  end
end
