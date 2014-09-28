class Users::InvitationsController < Devise::InvitationsController
  def create
    self.resource = invite_resource
    if resource.errors.empty?
      yield resource if block_given?
      set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
    else
      respond_with_navigational(resource)
    end
  end
  private
    def update_resource_params
      params.require(:user).permit(:invitation_token, :firstname, :lastname, :username, :phone_number, :email, :password, :password_confirmation)
    end
    
end