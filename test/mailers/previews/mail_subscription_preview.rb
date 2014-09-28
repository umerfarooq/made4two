# Preview all emails at http://localhost:3000/rails/mailers/mail_subscription
class MailSubscriptionPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_subscription/subscribe
  def subscribe
    MailSubscription.subscribe
  end

end
