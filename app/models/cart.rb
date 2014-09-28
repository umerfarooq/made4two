class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_one :order

  def add_tour(tour_id)
    current_item = line_items.find_by(tour_id: tour_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(tour_id: tour_id)
    end
    current_item
  end
  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end
end
