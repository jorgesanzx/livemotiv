class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    Rails.logger.debug "X"*80
    Rails.logger.debug auth_hash
    Rails.logger.debug "X"*80
    user = User.sign_in_or_sign_up(auth_hash["provider"], auth_hash["uid"], user_info)
    sign_in_and_redirect user
    set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  rescue StandardError => error
    flash[:alert] = "Failed to create your account (#{error.message}). Please, contact support@livemotiv.com"
    redirect_to root
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end

  def user_info
    {email: auth_hash["info"]["email"],
     nickname: auth_hash["info"]["nickname"].parameterize,
     name: auth_hash["info"]["name"],
     image: auth_hash["info"]["image"],
     location: auth_hash["info"]["location"],
     gender: auth_hash["extra"]["raw_info"]["gender"]}
  end
end
