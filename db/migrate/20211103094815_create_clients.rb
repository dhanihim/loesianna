class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :uid
      t.date :birthdate
      t.string :birthplace
      t.string :address
      t.string :phone
      t.string :status
      t.string :description

      t.timestamps
    end
  end
end
