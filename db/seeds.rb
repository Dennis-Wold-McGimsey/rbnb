# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Flat.destroy_all
User.destroy_all

puts "Creating users..."
user_1 = User.create(email: "chris@fake.com", password: "123123")

puts "Creating flats..."
flat_1 = {address: "20 Villa Chevreuse", city: "Paris", description: "Sunny flat near Paris ", price_per_day: 50, user: user_1, guests_allowed:5}
flat_2 = {address: "2 Rua do Conde de Redondo", city: "Lisbon", description: "Comfy Flat in center", price_per_day: 30, user: user_1, guests_allowed:5}
flat_3 = {address: "R. Correia Teles 36-54", city: "Lisbon", description: "Flat in Campo de Ourique", price_per_day: 60, user: user_1, guests_allowed:4}

[flat_1, flat_2, flat_3].each do |attributes|
  flat = Flat.create!(attributes)
  puts "Created #{flat.address}"
end


puts "Finished!"
