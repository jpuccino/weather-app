json.extract! weather_search, :id, :city, :state, :country, :zip, :created_at, :updated_at
json.url weather_search_url(weather_search, format: :json)
