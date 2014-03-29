# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    association :user
    sequence(:email) {|n| "email#{n}@example.com"}
    sequence(:nickname) {|n| "NickName#{n}"}
    name "First Second Name"
    image "http://graph.facebook.com/2/picture"
    location "Madrid, Spain"
    gender "male"
  end
end
