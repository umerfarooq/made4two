class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in user
      redirect_to(personal_user_path, notice: I18n.t("devise.sessions.signed_in", firstname: current_user.firstname, lastname: current_user.lastname))
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :facebook, :all
end
