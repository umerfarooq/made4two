json.array!(@we_loves) do |we_love|
  json.extract! we_love, :id, :description, :tour_id
  json.url we_love_url(we_love, format: :json)
end
