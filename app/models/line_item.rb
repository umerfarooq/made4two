class LineItem < ActiveRecord::Base
  belongs_to :tour
  belongs_to :cart
  def total_price
    tour.price * quantity
  end
end
