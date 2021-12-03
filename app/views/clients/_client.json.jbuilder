json.extract! client, :id, :name, :uid, :birthdate, :birthplace, :address, :phone, :status, :description, :created_at, :updated_at
json.url client_url(client, format: :json)
