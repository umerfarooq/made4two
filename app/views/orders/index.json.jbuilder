json.array!(@orders) do |order|
  json.extract! order, :id, :cart_id, :user_id, :amount
  json.url order_url(order, format: :json)
end
