class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :young_connections, class_name: :Connection, foreign_key: :young_id
  has_many :experienced_connections, class_name: :Connection, foreign_key: :experienced_id
  validates :email, :nickname, presence: true, uniqueness: true

  scope :valid_for_matching, ->(current_profile) {
    where.not(id: current_profile.id).where.not(age: nil)
  }

  def valid_for_matching?
    if age.present?
      true
    else
      false
    end
  end
end
