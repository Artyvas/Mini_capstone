# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.create([{ id: 1, name: "Vapor", brand: "BD", size: "L", price: 150.00, category: "Helmets", quantity: 10.00, image_url: "https://imgur.com/a/UfJDK7j", description: "A stylish 360 foa
  m climbing helmet. Be the envy of the climbing gym when you put this bad boy on your head" }])
product = Product.create([{ id: 2, name: "Z4", brand: "BD", size: "0.5", price: 75.00, category: "Protection", quantity: 5.00, image_url: "https://https://imgur.com/a/vRfZgLA", description: "An innovative cam with a flexible stem that is rigid when being placed." }])
product = Product.create([{ id: 3, name: "Solutions", brand: "LS", size: "40.5", price: 190.00, category: "Climbing shoes", quantity: 3.00, image_url: "https://imgur.com/a/KZl0SZa", description: "An aggresive shoe for hard sport, bouldering, and comp climbing" }])
supplier = Supplier.create(name: "Amazon", email: "amazon@amazon.com", phone_number: 9998887766)