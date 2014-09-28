json.array!(@wishlists) do |wishlist|
  json.extract! wishlist, :id, :tour_id, :user_id
  json.url wishlist_url(wishlist, format: :json)
end
