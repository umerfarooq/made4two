class MailSubscription < ActionMailer::Base
  default from: "from@example.com"
  def subscribe(tour)
    @tour = tour
    @subscriptions = Subscription.all.map {|s| s.email }
    #recipients      subscriptions.email
    #content_type    "multipart/alternative"
    #@subscriptions.each do |subscription|
      #mail bcc: , subject: "New tour today"
    #end
    mail(bcc: @subscriptions, subject: 'coba')
  end
end
