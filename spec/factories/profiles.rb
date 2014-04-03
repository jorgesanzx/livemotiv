# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    association :user
    sequence(:email) {|n| "email#{n}@example.com"}
    sequence(:nickname) {|n| "nickname#{n}"}
    name "Enjuto Mojamuto"
    image "http://graph.facebook.com/2/picture"
    location "Madrid, Spain"
    sequence(:age) {|n| 14 + 3*n}
    gender "male"
    job "student"
    web "livemotiv.com"
    summary "Chanante ipsum dolor sit amet, dolore hueles avinagrado coconut quis enim. Saepe adipisicing, zagal minim et one more time bonico del to, sed quis bufonesco te viste de torero monguer Guaper eveniet. Asobinao artista tempor ex ojete moreno. Payacho a tope con la maquinaria siberet ut adipisicing. Super nono mamellas zanguango to sueltecico ullamco enratonao droja."
    what_i_look_for "Chanante ipsum dolor sit amet, ut no te digo na y te lo digo to muchachada horcate vivo con tu madre en un castillo, chachacha. Incididunt asquerosito elit chavalada. Ojete moreno monguer Guaper incididunt forrondosco, tunante, one more time churretoso gambitero aliqua."
    offer_help? 1
    receive_help? 1
  end
end
