class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  def total_price
    
  end

  def save_with_payment
    if valid?
      Stripe::Charge.create(description: 'Payment for made4two',
                                       card: stripe_card_token,
                                       currency: "usd",
                                       amount: amount
                                       )
      
      save!
    end
    
  end  
end
