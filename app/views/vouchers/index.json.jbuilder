json.array!(@vouchers) do |voucher|
  json.extract! voucher, :id, :code, :user_id, :discount
  json.url voucher_url(voucher, format: :json)
end
