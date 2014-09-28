class OrderNotifier < ActionMailer::Base

  default from: "notification@made4two.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    cart = order.cart_id
    @line_items = LineItem.where(cart_id: cart)
    mail to: order.user.email, subject: 'Made4Two Order Notification'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.gift.subject
  #
  def gift(order)
    @order = order
    cart = order.cart_id
    @line_items = LineItem.where(cart_id: cart)
    mail to: order.email, subject: 'Made4Two Gift Notification'
  end
  def certicate(order)
    @order = order
    cart = order.cart_id
    @line_items = LineItem.where(cart_id: cart)
    mail to: order.email, subject: 'Made4Two Order Notification'
  end
end
