class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    provider = auth_hash["provider"]
    uid = auth_hash["uid"]
    User.sign_in_or_sign_up(provider, uid, user_info)
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end

  def user_info
    {email: auth_hash["info"]["email"],
     nickname: auth_hash["info"]["nickname"],
     name: auth_hash["info"]["name"],
     image: auth_hash["info"]["image"],
     location: auth_hash["info"]["location"],
     gender: auth_hash["extra"]["raw_info"]["gender"]}
  end
end