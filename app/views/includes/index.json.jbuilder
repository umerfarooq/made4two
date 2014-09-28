json.array!(@includes) do |include|
  json.extract! include, :id, :description, :tour_id
  json.url include_url(include, format: :json)
end
