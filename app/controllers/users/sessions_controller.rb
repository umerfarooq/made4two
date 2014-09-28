class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to(personal_user_path, notice: I18n.t("devise.sessions.login", firstname: current_user.firstname, lastname: current_user.lastname))
  end
  
end