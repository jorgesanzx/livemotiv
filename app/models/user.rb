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
  end
end
