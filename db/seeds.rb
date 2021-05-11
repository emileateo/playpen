# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD
require 'faker'

=======
require 'open-uri'
require 'json'
require 'faker'

url = "https://dog.ceo/api/breeds/image/random"
pets_serialized = URI.open(url).read
pet_image = JSON.parse(pets_serialized)
10.times do
    Pet.create(
      name: Faker::Creature::Dog.name,
      description: Faker::Creature::Dog.breed,
      photos: pet_image,
      temperament: Faker::Creature::Dog.meme_phrase,
      breed: Faker::Creature::Dog.breed
    )
end
>>>>>>> 954a85b7f70ae0f2c91bb8deab56d54eeb8b7ad2
