json.array!(@image_headers) do |image_header|
  json.extract! image_header, :id, :description, :image, :status
  json.url image_header_url(image_header, format: :json)
end
