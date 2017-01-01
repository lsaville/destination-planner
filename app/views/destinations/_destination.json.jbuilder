json.extract! destination, :id, :name, :zip, :description, :image_url, :created_at, :updated_at
json.url destination_url(destination, format: :json)