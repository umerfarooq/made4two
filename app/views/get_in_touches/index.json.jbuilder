json.array!(@get_in_touches) do |get_in_touch|
  json.extract! get_in_touch, :id, :name, :email, :subject, :message
  json.url get_in_touch_url(get_in_touch, format: :json)
end
