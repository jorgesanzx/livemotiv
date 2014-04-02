# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    association :user
    sequence(:email) {|n| "email#{n}@example.com"}
    sequence(:nickname) {|n| "nickname#{n}"}
    name "First Second Name"
    image "http://graph.facebook.com/2/picture"
    location "Madrid, Spain"
    sequence(:age) {|n| 14 + 3*n}
    gender "male"
    job "student"
    web "ninjastudent.com"
    summary "I'm a ninja student"
    what_i_look_for "I'm looking for a ninja to give me advice"
    offer_help? 1
    receive_help? 1
  end
end
