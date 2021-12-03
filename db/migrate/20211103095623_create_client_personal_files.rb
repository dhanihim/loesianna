class CreateClientPersonalFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :client_personal_files do |t|
      t.string :link
      t.string :description

      t.timestamps
    end
  end
end
