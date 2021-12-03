json.extract! client_activity, :id, :object, :associate, :assistant, :activity_expired, :certificate_expired, :serial_number, :offline_location, :description, :status, :deleted, :created_at, :updated_at
json.url client_activity_url(client_activity, format: :json)
