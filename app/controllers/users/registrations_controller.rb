class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        redirect_to(personal_user_url, notice: I18n.t("devise.sessions.signed_in", firstname: current_user.firstname, lastname: current_user.lastname))
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      sign_in resource_name, resource, bypass: true
      set_flash_message :notice, 'Successfully' if is_flashing_format?
    else
      clean_up_passwords resource
      
    end
  end
  def destroy
    Devise.session_reset
  end
  private
    def sign_up_params
      params.require(:user).permit(:firstname, :lastname, :username, :phone_number, :email, :password, :password_confirmation)
    end
    def account_update_params
      params.require(:user).permit(:address1, :address2, :city,:state, :country,:age, :gender,:firstname, :lastname, :username, :phone_number, :email, :password, :password_confirmation, :current_password)
    end
end