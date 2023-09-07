# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

puts "Cleaning DB..."
Review.destroy_all
puts "Reviews deleted"
Restaurant.destroy_all
puts "Restaurants deleted"
User.destroy_all
puts "User deleted"

puts "\ncreating users..."
first_user = User.create!(email: "albert@lewagon.org", password: "123456")
puts "#{first_user.email} is created"
second_user= User.create!(email: "alan@lewagon.org", password: "123456")
puts "#{second_user.email} is created"

puts "\nCreating restaurants..."
noma = Restaurant.new(user: first_user,
                  name: "Noma",
                  description: "Chef Rene Redzepi's gastronomic mecca, creating world-class dishes presented in 20-course meals.",
                  address: "Refshalevej 96",
                  zipcode: "1432",
                  city: "Copenhagen",
                  phone_number: "+45 32 96 32 97",
                  category: "contemporary",
                  opens_at: "2022-05-17 19:00:00 +0200",
                  closes_at: "2022-05-17 23:00:00 +0200")

noma_photo = URI.open("https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
noma.photo.attach(io: noma_photo, filename: "cover.png", content_type: "image/png")
noma.save
puts "#{noma.name} restaurant is created"

disfrutar = Restaurant.new(user: first_user,
                  name: "Disfrutar",
                  description: "In Barcelona the gastronomic offer revolves around the tasting menu, with clearly avant-garde cuisine and where the dishes stand out for their great, markedly Mediterranean identity. In short, a restaurant with daring, fun and modern cuisine searching for taste as the main proposition.",
                  address: "C. de Villarroel, 163",
                  zipcode: "08036",
                  city: "Barcelona",
                  phone_number: "972253448",
                  category: "contemporary",
                  opens_at: "2022-05-17 19:00:00 +0200",
                  closes_at: "2022-05-17 23:00:00 +0200")

disfrutar_photo = URI.open("https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
disfrutar.photo.attach(io: disfrutar_photo, filename: "cover.png", content_type: "image/png")
disfrutar.save
puts "#{disfrutar.name} restaurant is created"

den = Restaurant.new(user: second_user,
                  name: "Den",
                  description: "The taste of home cooking is different for everyone, but yet it is all prepared with the same wish, which is to make others happy. It brings warmth and closeness to one's heart, making us want to eat it every day. Homemade food is food prepared while thinking about others being happy. Every day, I think about the people who come to the restaurant and cook with the ingredients that arrive each day. For a homemade dish that brings a smile.",
                  address: "Architect house hall JIA",
                  zipcode: "2-3-18",
                  city: "Jingumae, Shibuya Ku, Tokyo",
                  phone_number: "03-6455-5433",
                  category: "contemporary",
                  opens_at: "2022-05-17 18:00:00 +0200",
                  closes_at: "2022-05-17 20:00:00 +0200")

den_photo = URI.open("https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
den.photo.attach(io: den_photo, filename: "cover.png", content_type: "image/png")
den.save
puts "#{den.name} restaurant is created"

piazza_duomo = Restaurant.new(user: second_user,
                  name: "Piazza Duomo",
                  description: "If Enrico Crippa's cuisine is a sensory journey, through time and space, the new menus interpret a double wish of the chef: on the one hand, to exalt the bond with the land and its history; on the other hand, to explore new frontiers of taste, in an ever-evolving creative synthesis that, while it always starts with seasonality and caring for the vegetable garden, is full of international influences.",
                  address: "Piazza Risorgimento, 4",
                  zipcode: "12051",
                  city: "Alba",
                  phone_number: "+39 0173 366167",
                  category: "contemporary",
                  opens_at: "2022-05-17 19:30:00 +0200",
                  closes_at: "2022-05-17 21:30:00 +0200")

piazza_duomo_photo = URI.open("https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
piazza_duomo.photo.attach(io: piazza_duomo_photo, filename: "cover.png", content_type: "image/png")
piazza_duomo.save
puts "#{piazza_duomo.name} restaurant is created"

puts "\nCreating reviews..."
noma_review = Review.create!(user: second_user, restaurant: noma, grade: "incredible", content: "es no doubt it is expensive but there’s a clear reason why it’s the best restaurant in the world. Flavours for the dishes are very complex and well balanced. Creative presentations. Beyond excellent service. Wine pairing was exquisite - love that they’re mostly natural wines and they just keep on pouring and pouring… I hope you also get a private kitchen tour at the end! Overall an unforgettable experience.")
puts "#{noma_review.restaurant.name} review is created"

disfrutar_review = Review.create!(user: second_user, restaurant: disfrutar, grade: "incredible", content: "Unforgetable experience! We had the Disfrutar classic menu with wine pairing. The food was delicious except the pigeon. However, some of the wine choices were not good at all. The service was extraordinary, like a well choreographed performance.  The ambience is a bit sterile, all white and lacking character.")
puts "#{disfrutar_review.restaurant.name} review is created"

den_review = Review.create!(user: first_user, restaurant: den, grade: "incredible", content: "What an amazing place! Each dish was served and packed full of flavor and freshness. Authentic and creative Japanese food. The food is very delicious. Staffs and services are very nice, friendly and fast! Highly recommended!")
puts "#{den_review.restaurant.name} review is created"

piazza_duomo_review = Review.create!(user: first_user, restaurant: piazza_duomo, grade: "incredible", content: "As the only three-Michelin-starred restaurant in the piemont region, it is definitely worth a visit. The wine list alone has three large books, where you can find rare and famous local barolo, as well as many international wines to choose from. The chef's philosophy on vegetable cuisine is undoubtedly excellent, using a wide variety of vegetables from his own garden to create stunning dishes. The fish and seafood are also handled with just the right amount of care, the desserts are very artistic and overall the combination of Italian cuisine with many Asian elements is very successful. Thanks Chef Enrico Crippa!")
puts "#{piazza_duomo_review.restaurant.name} review is created"
