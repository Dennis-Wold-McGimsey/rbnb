# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."
flat_1 = {address: "20 Villa Chevreuse", description: "Sunny flat near Paris ", price_per_day: 50}
flat_2 = {address: "2 Rua do Conde de Redonde", description: "Enjoy Lisbonne", price_per_day: 30}

[flat_1, flat_2].each do |attributes|
  flat = Flat.create!(attributes)
  puts "Created #{flat.address}"
end

puts "Finished!"
