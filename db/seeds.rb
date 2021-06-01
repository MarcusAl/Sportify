# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# users

puts "creating user"
User.create!(
  email: 'felix@test.com',
  password: 'password'
  )
puts "finsihed!"

puts "creating user"
User.create!(
  email: 'eddi@test.com',
  password: 'password'
  )
puts "finsihed!"

puts "creating user"
User.create!(
  email: 'marcus@test.com',
  password: 'password',
  owner: true
  )
puts "finsihed!"

puts "creating user"
User.create!(
  email: 'spencer@test.com',
  password: 'password'
  )
puts "finsihed!"

# courts

puts "creating court"
Court.create!(
  user_id: 3,
  address: Faker::Address.full_address,
  price: 65.50,
  description: 'Beautiful grass tennis court in pristine condition'
  )
puts "finsihed!"

puts "creating court"
Court.create!(
  user_id: 3,
  address: Faker::Address.full_address,
  price: 45.00,
  description: 'Very nice, real clay tennis court in great condition, well kept and ready to be played on!'
  )
puts "finsihed!"

# bookings

puts "creating booking"
Booking.create!(
  court_id: 1,
  user_id: 2,
  date: Faker::Time.forward(days: 10, period: :afternoon)
  )
puts "finsihed!"

puts "creating booking"
Booking.create!(
  court_id: 2,
  user_id: 4,
  date: Faker::Time.forward(days: 10, period: :afternoon)
  )
puts "finsihed!"

puts "creating booking"
Booking.create!(
  court_id: 1,
  user_id: 1,
  date: Faker::Time.forward(days: 10, period: :afternoon)
  )
puts "finsihed!"

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
