json.extract! client_activity_processlist, :id, :target_start, :actual_start, :status, :description, :created_at, :updated_at
json.url client_activity_processlist_url(client_activity_processlist, format: :json)
