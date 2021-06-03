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
  address: ["London", "Madrid", "Paris"].sample,
  price: (10..30).to_a.sample,
  description: "You'll be able to play tennis by day or by night.",
  category: %w(Indoor Outdoor).sample,
  surfaces: %w(Clay Hardcore Grass Concrete).sample,
  title: ["Perfection", "Beautiful", "Get your balls out"].sample
  )
  file = URI.open(url.sample)
  court.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "finished court"
end
    
puts "finsihed!"
