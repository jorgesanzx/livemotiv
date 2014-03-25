class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, presence: true

  def self.find_or_create(auth_hash)
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      user = User.create nickname: auth_hash["info"]["nickname"],
                         email: auth_hash["info"]["email"],
                         name: auth_hash["info"]["name"],
                         image: auth_hash["info"]["image"],
                         location: auth_hash["info"]["location"],
                         gender: auth_hash["extra"]["raw_info"]["gender"]
      auth = create user: user, provider: auth_hash["provider"], uid: auth_hash["uid"]
    end
  auth
  end
end
