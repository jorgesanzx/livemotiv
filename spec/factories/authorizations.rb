# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authorization do
    provider "MyString"
    uid "MyString"
    user nil
  end
end
