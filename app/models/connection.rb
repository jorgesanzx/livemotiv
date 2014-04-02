class Connection < ActiveRecord::Base
  belongs_to :young, class_name: :Profile
  belongs_to :experienced, class_name: :Profile

  def self.matching(current_profile)
    profiles_to_match = Profile.valid_for_matching(current_profile)

    profiles_to_match.each do |other_profile|
      affinity = affinity_between_profiles(current_profile, other_profile)
      if affinity >= 30 && current_profile.age <= other_profile.age
        connection = Connection.find_or_create_by(young: current_profile, experienced: other_profile)
        connection.update(affinity: affinity)
      elsif affinity >= 30 && current_profile.age > other_profile.age
        connection = Connection.find_or_create_by(young: other_profile, experienced: current_profile)
        connection.update(affinity: affinity)
      end
    end
  end

  private

  def self.affinity_between_profiles(profile1, profile2)
    Rails.logger.debug "X"*80
    Rails.logger.debug profile1.inspect
    Rails.logger.debug profile2.inspect
    Rails.logger.debug "X"*80
    affinity = 0.4 * age_affinity(profile1, profile2) + 0.6 * gender_affinity(profile1, profile2)
  end

  def self.age_affinity(profile1, profile2)
    age_difference = (profile1.age - profile2.age).abs

    if age_difference <= 14 && age_difference >= 4
      age_affinity = 800 / ((age_difference - 8).abs + 8)
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
end
