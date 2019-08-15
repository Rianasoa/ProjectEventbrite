# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "On supprime tout"
User.destroy_all
Event.destroy_all
Attendance.destroy_all
puts "C'est bon c'est clean !"

puts "Création d'utilisateurs"
10.times do 
  user = User.create!(email: Faker::Internet.free_email, description: Faker::Movies::HarryPotter.quote, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "motdepasse")
end
puts "Utilisateurs créés !"

puts "Création d'events"
10.times do 
  event = Event.create!(start_date: Faker::Date.forward, duration: 5 * rand(1..120), title: Faker::Book.title, description: Faker::Hacker.say_something_smart , price: rand(1...1000), location: Faker::TvShows::GameOfThrones.city, admin_id: rand(User.all.first.id..User.all.last.id))
end
puts "Events créés !"

puts "Création de reservation"
10.times do 
resa = Attendance.create!(stripe_customer_id: Faker::Lorem.characters, event_id: rand(Event.all.first.id..Event.all.last.id), user_id: rand(User.all.first.id..User.all.last.id))
end
puts "Réservation créée !"