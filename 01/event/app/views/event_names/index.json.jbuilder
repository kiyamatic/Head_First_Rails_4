json.array!(@event_names) do |event_name|
  json.extract! event_name, :id, :artist, :description, :price_low, :price_high, :event_date
  json.url event_name_url(event_name, format: :json)
end
