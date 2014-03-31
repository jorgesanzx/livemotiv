class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable,
  devise :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]

  has_one :profile

  def self.sign_in_or_sign_up(provider, uid, user_info)
    user = User.find_by(provider: provider, uid: uid)
    if user.nil?
      user = User.create!(provider: provider, uid: uid)
      profile = Profile.create!(user_info)
      profile.user = user
    end
    user
  end
end
