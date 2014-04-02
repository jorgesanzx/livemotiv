# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# def random_string
#   (0...8).map { ('a'..'z').to_a[rand(26)] }.join
# end

# 20.times do |i|
#   User.create(email: "email#{i+1}@example.com", password: 'password', password_confirmation: 'password')
# end

# User.all.each do |user|
#   5.times do |i|
#     Event.create(name: "Event #{i}", description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, quasi, maxime perspiciatis iure minima sequi doloribus praesentium eos deleniti? Quisquam deserunt libero fugit fuga quis placeat sint dicta ratione quas!', start_at: (i*3).days.from_now, end_at: (i*3+i).days.from_now, user: user)
#   end
# end

10.times do
  FactoryGirl.create(:profile)
end
