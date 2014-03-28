class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable,
  devise :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]

  has_one :profile

  def self.sign_in_or_sign_up(provider, uid, user_info)
    Rails.logger.debug "*"*80
    Rails.logger.debug provider
    Rails.logger.debug uid
    Rails.logger.debug user_info
    Rails.logger.debug "*"*80

    User.create!(provider: provider, uid: uid)

    Profile.create(user_info)
  #   unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  #     user = User.create nickname: auth_hash["info"]["nickname"],
  #                        email: auth_hash["info"]["email"],
  #                        name: auth_hash["info"]["name"],
  #                        image: auth_hash["info"]["image"],
  #                        location: auth_hash["info"]["location"],
  #                        gender: auth_hash["extra"]["raw_info"]["gender"]
  #     auth = create user: user, provider: auth_hash["provider"], uid: auth_hash["uid"]
  #   end
  # auth
  end

end
