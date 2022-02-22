# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rigitngs' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require_relative './seeds_helpers'


User.destroy_all

# Flat.destroy_all
adjectives = ['nice', 'decent', 'lovely', 'high-end', 'simple']
places = ['shibuya', 'harajuku', 'meguro', 'shimbashi']
descriptions = ["Owned by a nice grandma", "Come and meet us", "You won't be disturbed", "You can be as loud as you want"]
photos = picture_urls
types = photos.keys
counter = 0
n = 2
n.times do |i_user|
  puts "User #{i_user}/#{n}"
  user = User.create(email: Faker::Internet.email, password: 123456)
  rand(0..8).times do
    place = places.sample(1)[0]
    adj = adjectives.sample(1)[0]
    type = types.sample(1)[0]
    location = random_place_near("#{place} station")
    studio = Studio.new(
      name: "#{adj} #{type} in #{place}",
      address: location[:address],
      latitude: location[:lat],
      longitude: location[:lon],
      description: "#{adj} #{type}. #{descriptions.sample(1)[0]}.",
      price: rand(5..100)*100
    )
    studio.user = user
    file = URI.open(photos[type].sample(1)[0])
    studio.photo.attach(io: file, filename: "studio_#{counter}.png", content_type: 'image/png')
    studio.save
    counter += 1
  end
end
