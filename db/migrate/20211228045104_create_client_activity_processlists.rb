class CreateClientActivityProcesslists < ActiveRecord::Migration[6.1]
  def change
    create_table :client_activity_processlists do |t|
      t.date :target_start
      t.date :actual_start
      t.string :status
      t.string :description

      t.timestamps
    end
  end
end
