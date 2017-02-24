# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dive.destroy_all
User.destroy_all

avatar_photos_url = [
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949530/avatar20_xfeicw.jpg",
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949530/avatar19_d2nnhb.jpg",
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949530/avatar18_m27hhn.jpg",
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949529/avatar17_h5ac0r.jpg",
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949529/avatar2_hwac8s.jpg",
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949529/avatar11_yrrctz.jpg",
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949528/avatar8_rdfsau.jpg",
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949529/avatar9_w2olse.jpg",
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949528/avatar3_inqx0j.jpg",
  "http://res.cloudinary.com/daavbv2ca/image/upload/v1487949528/avatar4_x4wj4y.jpg"
]

5.times do
  name = Faker::Name.name
  level = [4, 5].sample
  max_depth = (1..40).to_a.sample
  photo_url = avatar_photos_url.sample
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
  photo_url = avatar_photos_url.sample
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

# 10.times do
#   location = ["Marseille", "Nice", "Montpellier", "Saint-tropez", "Biaritz"].sample
#   capacity = (1..10).to_a.sample
#   price = (1..200).to_a.sample
#   depth_required = (1..40).to_a.sample
#   description = Faker::ChuckNorris.fact
#   photo_urls = [Faker::LoremPixel.image, Faker::LoremPixel.image]
#   user = User.where("teacher = true").to_a.sample
#   new_dive = Dive.create!(
#     location: location,
#     capacity: capacity,
#     price: price,
#     photo_urls: photo_urls,
#     depth_required: depth_required,
#     description: description,
#     user: user
#   )

# end
