class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:fullname, :username, :email, :password, :password_confirmation, :photo, :photo_cache, :cover_image, :cover_image_cache)
  end

  def account_update_params
    params.require(:user).permit(:fullname, :name, :username, :email, :password, :password_confirmation, :current_password, :photo, :photo_cache, :cover_image, :cover_image_cache)
  end
end
