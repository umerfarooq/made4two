# Preview all emails at http://localhost:3000/rails/mailers/welcome_notifier
class WelcomeNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcome_notifier/message
  def message
    WelcomeNotifier.message
  end

end
