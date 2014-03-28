class Profile < ActiveRecord::Base
  belongs_to :user
  validates :email, :nickname, presence: true, uniqueness: true
end
