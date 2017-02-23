# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dive.destroy_all
User.destroy_all

5.times do
  name = Faker::Name.name
  level = [4, 5].sample
  max_depth = (1..40).to_a.sample
  photo_url = Faker::LoremPixel.image
  bio = Faker::HarryPotter.quote
  email = name.downcase.gsub(/[^a-z]/, "") + "@mail.com"
  password = "password"
  new_user = User.create!(
    name: name,
    level: level,
    max_depth: max_depth,
    photo_url: photo_url,
    bio: bio,
    email: email,
    password: password
  )
  new_user.teacher = true
  new_user.save
end

5.times do
  name = Faker::Name.name
  level = (1..5).to_a.sample
  max_depth = (1..40).to_a.sample
  photo_url = Faker::LoremPixel.image
  bio = Faker::HarryPotter.quote
  email = name.downcase.gsub(/[^a-z]/, "") + "@mail.com"
  password = "password"
  new_user = User.create!(
    name: name,
    level: level,
    max_depth: max_depth,
    photo_url: photo_url,
    bio: bio,
    email: email,
    password: password
  )
end

10.times do
  location = ["Marseille", "Nice", "Montpellier", "Saint-tropez", "Biaritz"].sample
  capacity = (1..10).to_a.sample
  price = (1..200).to_a.sample
  depth_required = (1..40).to_a.sample
  description = Faker::ChuckNorris.fact
  photo_urls = [Faker::LoremPixel.image, Faker::LoremPixel.image]
  user = User.where("teacher = true").to_a.sample
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
