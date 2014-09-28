class WelcomeNotifier < ActionMailer::Base
  default from: "from@example.com"

  def notifier(user)
    @user = user

    mail to: user.email, subject: "Welcome to Made4two"
  end
end
