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



puts "Cleaning up database..."
User.destroy_all
puts "Database cleaned"

user = User.create!(
      email: Faker::Internet.email,
      password: "123456")

10.times do
  url = "https://dog.ceo/api/breeds/image/random"
  pets_serialized = URI.open(url).read
  pet_image = JSON.parse(pets_serialized)
  file = URI.open(pet_image["message"])
  pet_new = Pet.new(
    name: Faker::Creature::Dog.name,
    description: Faker::Creature::Dog.breed,
    temperament: Faker::Creature::Dog.meme_phrase,
    breed: Faker::Creature::Dog.breed,
    user: user
  )
  pet_new.photo.attach(io: file, filename: pet_new.name, content_type: 'image/jpg')
  pet_new.save!
end



