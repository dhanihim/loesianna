class ChangeExpiredToDatetime < ActiveRecord::Migration[6.1]
  def change
      change_column :client_activities, :activity_expired, :date
      change_column :client_activities, :certificate_expired, :date
  end
end
