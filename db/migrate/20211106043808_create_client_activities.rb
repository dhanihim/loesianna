class CreateClientActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :client_activities do |t|
      t.string :object
      t.string :associate
      t.string :assistant
      t.datetime :activity_expired
      t.datetime :certificate_expired
      t.string :serial_number
      t.string :offline_location
      t.string :description
      t.string :status
      t.integer :deleted

      t.timestamps
    end
  end
end
