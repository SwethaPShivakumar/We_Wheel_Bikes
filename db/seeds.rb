# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: "abc@gmail.com",
            password:"123456",
            first_name: "Swetha",
            last_name: "Pattanshetty")
Bike.create!(name:"City Cruiser Rental",
            latitude:-38.9,
            longitude: 144.895342,
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
