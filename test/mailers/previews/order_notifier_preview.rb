# Preview all emails at http://localhost:3000/rails/mailers/order_notifier
class OrderNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_notifier/received
  def received
    OrderNotifier.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_notifier/gift
  def gift
    OrderNotifier.gift
  end

end
