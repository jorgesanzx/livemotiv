# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |index|
  user = User.create(provider: "facebook", uid: index)
  profile = Profile.create(user_id: user.id,
                           email: "doctor#{index}@teeth.com",
                           username: "username#{index}",
                           name: "Doctor Teeth",
                           image: "http://www.renaissancedental.com/getmedia/01415272-3342-4c4b-b795-716d55e8b2f0/Dentist_caucasian_man.aspx?width=180&height=180",
                           location: "Madrid, Spain",
                           age: 20 + 3*index,
                           gender: "male",
                           job: "Dentist",
                           web: "livemotiv.com",
                           summary: "Chanante ipsum dolor sit amet, dolore hueles avinagrado coconut quis enim. Saepe adipisicing, zagal minim et one more time bonico del to, sed quis bufonesco te viste de torero monguer Guaper eveniet. Asobinao artista tempor ex que pelazo. Payacho a tope con la maquinaria siberet ut adipisicing. Super nono mamellas zanguango to sueltecico ullamco enratonao droja.",
                           what_i_look_for: "Chanante ipsum dolor sit amet, ut no te digo na y te lo digo to muchachada horcate vivo con tu madre en un castillo, chachacha. Incididunt asquerosito elit chavalada. Monguer Guaper incididunt forrondosco, tunante, one more time churretoso gambitero aliqua.",
                           offer_help?: true,
                           receive_help?: false)
  Test.create(profile_id: profile.id,
              openness: rand(1..5),
              conscientiousness: rand(1..5),
              extraversion: rand(1..5),
              agreeableness: rand(1..5),
              neuroticism: rand(1..5))
end
