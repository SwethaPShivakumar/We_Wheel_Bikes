# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

user = User.create(email: "abc@gmail.com",
            password:"123456",
            first_name: "Swetha",
            last_name: "Pattanshetty")
Bike.create!(name:"City Cruiser Rental",
            latitude:-38.9,
            longitude: 144.8,
            description:"Dutch-style Lekker cruisers are perfect for checking out the city.",
            price: 30,
            address: "494 station street, Carlton North",
            user: user,
            category: "City")

Bike.create!(name:"E-Bike Rental, Lekker x",
            latitude:-38.5,
            longitude: 144.895342,
            description:"If you need a little power boost to help you get around, the e-bike is your best bet. These bikes are peddle-assist so every time you peddle you’ll get some assistance from the battery. Of course even if you don’t need it, our Lekker e-bikes are a fun and easy way to see Melbourne.",
            price: 35,
            address: "38 swan street, Richmond, Victoria, Australia",
            user: user,
            category: "MTB")

Bike.create!(name:"Mountain Bike Rental Merida Big 7/9 60x2",
            latitude:-38.938896,
            longitude: 144.2,
            description:"if you’re more comfortable riding a bike with flat handlebars, this is going to be the best choice for you (no matter where you plan to ride).",
            price: 35,
            address: "Melbourne Museum",
            user: user,
            category: "MTB")

Bike.create!(name:"Flat bar Road Bike Rental, Merida speeder 20",
            latitude:-38.938896,
            longitude: 143.1,
            description:"Longer rides are most suited to the road bike. We recommend taking this one down to the Bay Trail towards Brighton, Half-Moon Bay and beyond (even the Great Ocean Road if you have the cojones!)",
            price: 30,
            address: "Chapel Street, Melbourne",
            user: user,
            category: "Race")

images = ['https://images.unsplash.com/photo-1487803836022-91054ca05fdd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
          'https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          'https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1122&q=80',
          'https://images.unsplash.com/photo-1559348349-86f1f65817fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80']

Bike.all.each_with_index do |bike, index|
  url = images[index]
  file = URI.open(url)
  bike.photo.attach(io: file, filename: "#{bike.name}.jpg", content_type: "image/jpg")
  bike.save
end
