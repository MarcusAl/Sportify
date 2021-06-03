# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

# # users

require "open-uri"
User.destroy_all
Court.destroy_all
Booking.destroy_all
url1 = "https://media.architecturaldigest.com/photos/577283445ea3e586576ec520/master/w_1600%2Cc_limit/Tennis_Center.jpg"
url2 = "https://media.architecturaldigest.com/photos/596d2d14fde163455758e211/master/w_1600%2Cc_limit/goldstein.jpg"
url3 = "https://media.architecturaldigest.com/photos/55e7649e302ba71f30164877/master/w_1600%2Cc_limit/dam-images-architecture-2014-08-tennis-courts-striking-tennis-courts-02-newport-rhode-island-international-tennis-hall-of-fame.jpg"
url4 = "https://media.architecturaldigest.com/photos/55e7649f302ba71f3016487c/master/w_1600%2Cc_limit/dam-images-architecture-2014-08-tennis-courts-striking-tennis-courts-05-outer-hebrides-scottland.jpg"
url5 = "https://media.architecturaldigest.com/photos/55e7649fcd709ad62e8e6ed2/master/w_1600%2Cc_limit/dam-images-architecture-2014-08-tennis-courts-striking-tennis-courts-04-the-astors-rhinebeck-ny-court.jpg"
url6 = "https://media.architecturaldigest.com/photos/596d2f7b0f3eb15612a62b46/master/w_1600%2Cc_limit/Grand%2520SVP.jpg"
url7 = "https://media.architecturaldigest.com/photos/55e764a0cd709ad62e8e6ed7/master/w_1600%2Cc_limit/dam-images-architecture-2014-08-tennis-courts-striking-tennis-courts-03-il-san-pietro-de-positano-resort.jpg"
url8 = "https://media.architecturaldigest.com/photos/596d2d19c5ba1157bf2ba579/master/w_1600%2Cc_limit/SLS%2520LUX_Pool%2520terrace.jpg"
url9 = "https://media.architecturaldigest.com/photos/596d2d160f3eb15612a62b42/master/w_1600%2Cc_limit/Hyde%2520Midtown.jpg"
url = [url1, url2, url3, url4, url5, url6, url7, url8, url9]
puts "creating user"
edi = User.create!(
  first_name: "Edi",
  last_name: "Ciugulea",
  email: 'edi@test.com',
  password: '123456'
  )
5.times do
    puts "creating a court"
  court = Court.create!(
  user_id: edi.id,
  address: ["London", "Madrid", "Paris", "Oslo", "Dubai", "Edinburgh", "Krakow", "Rome"].sample,
  price: (10..30).to_a.sample,
  description: ["You'll be able to play tennis by day or by night, on specially lit courts, surrounded by tropical Bahamian flowers and cool sea breezes. With no limits on what and when you can play, there are plenty of hours in the day to practice your service.", "tennis training here is the perfect combination of a great climate, magnificent views and professional tennis sessions will make your stay unforgettable.", "What better way could there be to play tennis. Whether you're a beginner or pro, this resort's tennis academy can tailor make a programme to suit you; whether it's developing existing skills or starting from scratch, by the end of your holiday you will want to be involved in one of the weekly tournaments – who knows, you could go on to become the new Federer."].sample,
  category: %w(Indoor Outdoor).sample,
  surfaces: %w(Clay Hardcore Grass Concrete).sample,
  title: ["Perfection", "Beautiful", "Get your balls out", "No place better to grind away for hours", "They say the French can go for days"].sample
  )
  file = URI.open(url.sample)
  court.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "finished court"
end
puts "finsihed!"
puts "creating user"
felix = User.create!(
  first_name: "Felix",
  last_name: "Altenburg",
  email: 'felix@test.com',
  password: '123456'
  )
5.times do
    puts "creating a court"
  court = Court.create!(
  user_id: felix.id,
  address: ["London", "Madrid", "Paris", "Oslo", "Dubai", "Edinburgh", "Krakow", "Rome"].sample,
  price: (20..50).to_a.sample,
  description: ["You'll be able to play tennis by day or by night, on specially lit courts, surrounded by tropical Bahamian flowers and cool sea breezes. With no limits on what and when you can play, there are plenty of hours in the day to practice your service.", "tennis training here is the perfect combination of a great climate, magnificent views and professional tennis sessions will make your stay unforgettable.", "What better way could there be to play tennis. Whether you're a beginner or pro, this resort's tennis academy can tailor make a programme to suit you; whether it's developing existing skills or starting from scratch, by the end of your holiday you will want to be involved in one of the weekly tournaments – who knows, you could go on to become the new Federer."].sample,
  category: %w(Indoor Outdoor).sample,
  surfaces: %w(Clay Hardcore Grass Concrete).sample,
  title: ["Perfection", "Beautiful", "Get your balls out", "No place better to grind away for hours", "They say the French can go for days"].sample
  )
  file = URI.open(url.sample)
  court.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "finished court"
end
puts "finsihed!"
puts "creating user"
marcus = User.create!(
  first_name: "Marcus",
  last_name: "Allen",
  email: 'marcus@test.com',
  password: '123456'
  )
5.times do
    puts "creating a court"
  court = Court.create!(
  user_id: marcus.id,
  address: ["London", "Madrid", "Paris", "Oslo", "Dubai", "Edinburgh", "Krakow", "Rome"].sample,
  price: (40..70).to_a.sample,
  description: ["You'll be able to play tennis by day or by night, on specially lit courts, surrounded by tropical Bahamian flowers and cool sea breezes. With no limits on what and when you can play, there are plenty of hours in the day to practice your service.", "tennis training here is the perfect combination of a great climate, magnificent views and professional tennis sessions will make your stay unforgettable.", "What better way could there be to play tennis. Whether you're a beginner or pro, this resort's tennis academy can tailor make a programme to suit you; whether it's developing existing skills or starting from scratch, by the end of your holiday you will want to be involved in one of the weekly tournaments – who knows, you could go on to become the new Federer."].sample,
  category: %w(Indoor Outdoor).sample,
  surfaces: %w(Clay Hardcore Grass Concrete).sample,
  title: ["Perfection", "Beautiful", "Get your balls out", "No place better to grind away for hours", "They say the French can go for days"].sample
  )
  file = URI.open(url.sample)
  court.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "finished court"
end
puts "finsihed!"
puts "creating user"
spencer = User.create!(
  first_name: "Spencer",
  last_name: "Ryton",
  email: 'spencer@test.com',
  password: '123456'
  )
5.times do
    puts "creating a court"
  court = Court.create!(
  user_id: spencer.id,
  address: ["London", "Madrid", "Paris", "Oslo", "Dubai", "Edinburgh", "Krakow", "Rome"].sample,
  price: (70..999).to_a.sample,
  description: ["You'll be able to play tennis by day or by night, on specially lit courts, surrounded by tropical Bahamian flowers and cool sea breezes. With no limits on what and when you can play, there are plenty of hours in the day to practice your service.", "tennis training here is the perfect combination of a great climate, magnificent views and professional tennis sessions will make your stay unforgettable.", "What better way could there be to play tennis. Whether you're a beginner or pro, this resort's tennis academy can tailor make a programme to suit you; whether it's developing existing skills or starting from scratch, by the end of your holiday you will want to be involved in one of the weekly tournaments – who knows, you could go on to become the new Federer."].sample,
  category: %w(Indoor Outdoor).sample,
  surfaces: %w(Clay Hardcore Grass Concrete).sample,
  title: ["Perfection", "Beautiful", "Get your balls out", "No better place to grind away for hours", "They say the French can go for days"].sample
  )
  file = URI.open(url.sample)
  court.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "finished court"
end
puts "finsihed!"

# Booking.delete_all
# Court.delete_all

# puts "creating user"
# User.create!(
#   email: 'felix@test.com',
#   password: 'password'
#   )
# puts "finsihed!"

# puts "creating user"
# User.create!(
#   email: 'eddi@test.com',
#   password: 'password'
#   )
# puts "finsihed!"

# puts "creating user"
# User.create!(
#   email: 'marcus@test.com',
#   password: 'password',
#   owner: true
#   )
# puts "finsihed!"

# puts "creating user"
# User.create!(
#   email: 'spencer@test.com',
#   password: 'password'
#   )
# puts "finsihed!"

# # courts

# puts "creating court"
# Court.create!(
#   user_id: 3,
#   address: Faker::Address.city,
#   price: 65.50,
#   description: 'Beautiful grass tennis court in pristine condition'
#   )
# puts "finsihed!"

# puts "creating court"
# Court.create!(
#   user_id: 3,
#   address: Faker::Address.city,
#   price: 45.00,
#   description: 'Very nice, real clay tennis court in great condition, well kept and ready to be played on!'
#   )
# puts "finsihed!"

# # bookings

# puts "creating booking"
# Booking.create!(
#   court_id: 1,
#   user_id: 2,
#   date: Faker::Time.forward(days: 10, period: :afternoon)
#   )
# puts "finsihed!"

# puts "creating booking"
# Booking.create!(
#   court_id: 2,
#   user_id: 4,
#   date: Faker::Time.forward(days: 10, period: :afternoon)
#   )
# puts "finsihed!"

# puts "creating booking"
# Booking.create!(
#   court_id: 1,
#   user_id: 1,
#   date: Faker::Time.forward(days: 10, period: :afternoon)
#   )
# puts "finsihed!"

# 30.times do
#   puts "creating user"
#   User.create!(
#     email: Faker::Internet.email,
#     password: 'password'
#     )
#   puts "finsihed!"
# end

# 10.times do
#   puts "creating court"
#   Court.create!(
#     user_id: rand(1..10),
#     address: Faker::Address.full_address,
#     price: rand(10..50),
#     description: 'very nice tennic court, great condition and ready to be played on!'
#     )
#   puts "finsihed!"
# end

# 15.times do
#   puts "creating booking"
#   Booking.create!(
#     court_id: rand(1..10),
#     user_id: rand(1..30),
#     date: Faker::Time.forward(days: 15, period: :afternoon)
#     )
#   puts "finsihed!"
# end
