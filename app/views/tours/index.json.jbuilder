json.array!(@tours) do |tour|
  json.extract! tour, :id, :title, :location, :price, :image
  json.url tour_url(tour, format: :json)
end
