# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database...'
Accommodation.destroy_all

puts 'Creating accommodations...'

100.times do
  accommodation = Accommodation.create(
    name: "Apartment in #{Faker::Address.city}",
    address: Faker::Address.full_address,
    rating: rand(1..5)
  )
  puts "Accommodation with id: #{accommodation.id} has been created"
end

puts 'Finished!'
