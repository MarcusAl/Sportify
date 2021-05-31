# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Court.destroy_all
Booking.destroy_all

require 'faker'

30.times do
  puts "creating user"
  User.create!(
    email: Faker::Internet.email,
    password: 'password'
    )
  puts "finsihed!"
end

10.times do
  puts "creating court"
  Court.create!(
    user_id: rand(1..10),
    address: Faker::Address.full_address,
    price: rand(10..50)
    )
  puts "finsihed!"
end

15.times do
  puts "creating booking"
  Booking.create!(
    court_id: rand(1..10),
    user_id: rand(1..30),
    date: Faker::Time.forward(days: 15, period: :afternoon)
    )
  puts "finsihed!"
end
