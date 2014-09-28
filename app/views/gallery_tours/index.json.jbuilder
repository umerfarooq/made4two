json.array!(@gallery_tours) do |gallery_tour|
  json.extract! gallery_tour, :id, :title, :image, :content, :status, :tour_id
  json.url gallery_tour_url(gallery_tour, format: :json)
end
