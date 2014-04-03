class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.sign_in_or_sign_up(auth_hash["provider"], auth_hash["uid"], user_info)
    sign_in_and_redirect user
    set_flash_message(:success, :success, kind: "Facebook") if is_navigational_format?
  rescue StandardError => error
    flash[:danger] = "Failed to create your account (#{error.message}). Please, contact support@livemotiv.com"
    redirect_to root
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end

  def user_info
    {email: auth_hash["info"]["email"],
     username: auth_hash["info"]["nickname"].parameterize,
     name: auth_hash["info"]["name"],
     # image: auth_hash["info"]["image"],
     image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/t5.0-1/623909_100004583678770_1325152658_n.jpg",
     location: auth_hash["info"]["location"],
     gender: auth_hash["extra"]["raw_info"]["gender"]}
  end
end
