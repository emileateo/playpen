# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

url = "https://dog.ceo/api/breeds/image/random"
pets_serialized = URI.open(url).read
pet_image = JSON.parse(pets_serialized)

puts "Cleaning up database..."
Pet.destroy_all
User.destroy_all
puts "Database cleaned"

10.times do
    Pet.create(
      name: Faker::Creature::Dog.name,
      description: Faker::Creature::Dog.breed,
      photos: pet_image["message"],
      temperament: Faker::Creature::Dog.meme_phrase,
      breed: Faker::Creature::Dog.breed
    )

    User.create(
      email: Faker::Internet.email)
end



