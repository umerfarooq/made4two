# Preview all emails at http://localhost:3000/rails/mailers/voucher_notifier
class VoucherNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/voucher_notifier/notifier
  def notifier
    VoucherNotifier.notifier
  end

end
