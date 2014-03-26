# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authorization do
    provider "facebook"
    uid "'2'"

    association :user
  end
end
