# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rigitngs' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
# Flat.destroy_all
adjectives = ['nice', 'decent', 'lovely', 'high-end', 'simple']
places = ['shibuya', 'harajuku', 'meguro', 'ofuna', 'shimbashi']
descriptions = ["Owned by a nice grandma", "Come and meet us", "You won't be disturbed", "You can be as loud as you want"]

photos = {
  'just a room' => [
    'https://www.princehotels.com/sunshine/wp-content/uploads/sites/3/2019/07/city-10to24f-japanese-style-tatami-rooms.jpg',
    'data:image/jpeg;base64,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',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/plaidfox-oceanview-0530-1641583281.jpg',
    'https://www.grandmashousebb.com/uploads/1/1/7/5/11753790/published/grandmas-house-bed-and-breakfast-common-room-4.jpg?1535557754'
  ],

  'home studio' => [
    'https://dt7v1i9vyp3mf.cloudfront.net/styles/news_large/s3/imagelibrary/S/StudioSOS_0419_01-f6RXP_X55KTax6P6xkJY6E3y5Fr20cVk.jpg',
    'https://s7d1.scene7.com/is/image/izotope/01-home-studio?resMode=sharp2&wid=2000&',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiATmNSZk5nyc_egdgawOUkqkUgjUIAVAzd1kJlwhwiZqOpmvtQAN7XQVW8OPKh4XhJzQ&usqp=CAU',
    'https://i.pinimg.com/originals/52/43/79/524379c53bc63ed384f8b362a57df376.jpg',
    'https://i.pinimg.com/originals/d5/ed/53/d5ed53a5241596adf1a85994b3524a66.jpg'
  ],
  'recording studio' => [
    'https://cdn.mos.cms.futurecdn.net/WFDPhfecCXjdbyRi7jf3ee.jpg',
    'https://dt7v1i9vyp3mf.cloudfront.net/styles/news_large/s3/imagelibrary/O/OffTheRecord_1215_01-egGv7lLUwrFYPgjjIxXPxG.J2VjHldFX.jpg',
    'https://i.pinimg.com/originals/25/71/3f/25713fdfa829a9513536661f3eaad441.jpg',
    'https://i.pinimg.com/originals/09/82/2b/09822bb7d471aa8f15fb78b2f4c14f7a.jpg'],

  'soundproof room' => [
    'https://images.easytechjunkie.com/soundproof-room.jpg',
    'https://www.tomorrowsleep.com/wp-content/uploads/2019/01/How-To-Soundproof-A-Bedroom-1.jpg',
    'https://www.grooveboxstudios.com/wp-content/uploads/2020/01/soundproof-room-activites.jpg',
    'https://thenewsvoice.com/wp-content/uploads/2021/03/MMTacustix.jpeg'],
  'living room' => [
    'https://i.pinimg.com/originals/55/4e/10/554e100eab2b21c73036669b1a85493d.jpg',
    'https://i.pinimg.com/originals/ca/80/24/ca8024cfe8c4496131be3d86e6afa009.jpg',
    'https://storage.googleapis.com/gen-atmedia/2/2016/02/4bdd18e9b5a9e39b39cd1b476f1c87dad11404b0.jpeg',
    'https://i.pinimg.com/originals/d5/4b/1e/d54b1e15150823f92940ba9792ca0c41.jpg',
    'https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1560366499000/photosp/98f094ae-e218-436f-99a4-c0653decce47/stock-photo-wall-guitar-living-room-home-collection-couch-natural-light-electric-guitar-guitars-98f094ae-e218-436f-99a4-c0653decce47.jpg'
  ] ,
  'bathroom'=> [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqI74LpzAhL44nSBmgwb4tzDOm7WziJasSgA&usqp=CAU',
    'https://st.hzcdn.com/simgs/pictures/bathrooms/guitar-sink-castletech-inc-img~7cc11463040794d4_4-2720-1-df3f83c.jpg',
    'https://i.redd.it/0o5m1nsjpof01.jpg'
  ]}
types = photos.keys
counter = 0
10.times do
  user = User.create(email: Faker::Internet.email, password: 123456)
  rand(0..2).times do
    place = places.sample(1)[0]
    adj = adjectives.sample(1)[0]
    type = types.sample(1)[0]
    studio = Studio.new(
      name: "#{adj} #{type} in #{place}",
      address: "#{Faker::Address.street_address}, #{place}",
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
