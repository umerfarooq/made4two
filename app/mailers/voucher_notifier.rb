class VoucherNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.voucher_notifier.notifier.subject
  #
  def notifier(voucher)
    @voucher = voucher

    mail to: voucher.user.email, subject: 'Made4two Voucher Notifier'
  end
end
