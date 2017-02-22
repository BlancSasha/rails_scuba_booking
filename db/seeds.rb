# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dive.destroy_all

10.times do
  location = Faker::Address.city + " " + Faker::Address.country
  capacity = (1..10).to_a.sample
  price = (1..200).to_a.sample
  depth_required = (1..40).to_a.sample
  description = Faker::ChuckNorris.fact
  photo_urls = [Faker::LoremPixel.image, Faker::LoremPixel.image]
  id = [1, 2].sample
  user = User.find(id)
  new_dive = Dive.create!(
    location: location,
    capacity: capacity,
    price: price,
    photo_urls: photo_urls,
    depth_required: depth_required,
    description: description,
    user: user
  )

end
