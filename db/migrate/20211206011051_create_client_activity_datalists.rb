class CreateClientActivityDatalists < ActiveRecord::Migration[6.1]
  def change
    create_table :client_activity_datalists do |t|
      t.string :link
      t.string :description

      t.timestamps
    end
  end
end
