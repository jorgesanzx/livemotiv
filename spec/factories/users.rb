# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "facebook"
    sequence(:uid) {|n| "#{n}"}
  end
end
