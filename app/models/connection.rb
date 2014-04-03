class Connection < ActiveRecord::Base
  belongs_to :young, class_name: :Profile
  belongs_to :experienced, class_name: :Profile

  def self.matching(current_profile)
    profiles_to_match = Profile.valid_for_matching(current_profile)

    profiles_to_match.each do |other_profile|
      affinity = affinity_between_profiles(current_profile, other_profile)
      if affinity >= 30 && current_profile.age <= other_profile.age
        connection = Connection.find_or_create_by!(young: current_profile, experienced: other_profile)
        connection.update(affinity: affinity)
      elsif affinity >= 30 && current_profile.age > other_profile.age
        connection = Connection.find_or_create_by!(young: other_profile, experienced: current_profile)
        connection.update(affinity: affinity)
      end
    end
  end

  def self.profiles_connected(user)
    connections = connections_more_experienced_than_user(user)
    connections.reduce(Array.new) do |profiles_connected, connection|
      if connection.young == user.profile
        profiles_connected << connection.experienced
      else
        profiles_connected << connection.young
      end
      profiles_connected
    end
  end

  def self.affinities(user)
    connections = connections_more_experienced_than_user(user)
    connections.reduce(Array.new) do |affinities, connection|
      affinities << connection.affinity
    end
  end

  scope :connections_more_experienced_than_user, ->(user) {
    where(young_id: user.profile.id).order(affinity: :desc)
  }

  scope :connections_of_user, ->(user) {
    where("experienced_id=? OR young_id=?", user.profile.id, user.profile.id).order(affinity: :desc)
  }

  private

  def self.affinity_between_profiles(profile1, profile2)
    affinity = 0.2 * age_affinity(profile1, profile2) + 0.4 * gender_affinity(profile1, profile2) + 0.4 * test_affinity(profile1, profile2)
  end

  def self.age_affinity(profile1, profile2)
    age_difference = (profile1.age - profile2.age).abs

    if (age_difference <= 20 && age_difference >= 5)
      age_affinity = 100 - (5 * (age_difference - 5))
    else
      age_affinity = 0
    end
  end

  def self.gender_affinity(profile1, profile2)
    if profile1.gender == profile2.gender
      gender_affinity = 100
    else
      gender_affinity = 0
    end
  end

  def self.test_affinity(profile1, profile2)
    open_diff = (profile1.test.openness - profile2.test.openness).abs
    cons_diff = (profile1.test.conscientiousness - profile2.test.conscientiousness).abs
    extr_diff = (profile1.test.extraversion - profile2.test.extraversion).abs
    agre_diff = (profile1.test.agreeableness - profile2.test.agreeableness).abs
    neur_diff = (profile1.test.neuroticism - profile2.test.neuroticism).abs
    test_affinity = 100 - (5 * (open_diff + cons_diff + extr_diff + agre_diff + neur_diff))
  end
end
