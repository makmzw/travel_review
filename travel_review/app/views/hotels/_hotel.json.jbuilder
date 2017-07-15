json.extract! hotel, :id, :title, :description, :address, :service, :rating, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
