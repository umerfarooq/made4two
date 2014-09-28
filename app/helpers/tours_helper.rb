module ToursHelper
  def price(qty,price)
    total = number_to_currency(qty*price, :unit => '£')
  end
  def total_price(line_items)
    line_items.to_a.sum {|item| item.total_price}
  end
end
