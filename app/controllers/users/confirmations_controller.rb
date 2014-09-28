class Users::ConfirmationsController < Devise::ConfirmationsController
  def show
    token = Devise.token_generator.digest(self,:confirmation_token, params[:confirmation_token])
    @user = User.find_by(confirmation_token: token)
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?  
      WelcomeNotifier.notifier(@user).deliver
      set_flash_message(:notice, :confirmed) if is_flashing_format?
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end
end