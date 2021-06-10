require 'faker'

User.destroy_all
Property.destroy_all

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Name.first_name + "@yopmail.com",
    password: "azerty",
  )
  puts "Create User"
end

30.times do 
  property = Property.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.sentence,
    price: Faker::Number.number(digits: 6),
    location: Faker::Address.city,
    category: ["Maison", "Studio", "Villa", "Appartement"].sample,
    user_id: User.all.sample.id,
  )  
  puts "Create Proprety"
end