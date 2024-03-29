require 'test_helper'

class MailSubscriptionTest < ActionMailer::TestCase
  test "subscribe" do
    mail = MailSubscription.subscribe
    assert_equal "Subscribe", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
