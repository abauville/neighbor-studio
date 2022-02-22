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
<<<<<<< HEAD
descriptions = ["Owned by a nice grandma", "Come and meet us", "You won't be disturbed",
                "You can be as loud as you want"]
=======
descriptions = ["Owned by a nice grandma", "Come and meet us", "You won't be disturbed", "You can be as loud as you want"]
>>>>>>> f92a271447e1bee5860f808b2129f6798a1abd11

photos = {
  'just a room' => [
    'https://www.princehotels.com/sunshine/wp-content/uploads/sites/3/2019/07/city-10to24f-japanese-style-tatami-rooms.jpg',
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
<<<<<<< HEAD
    'https://i.pinimg.com/originals/09/82/2b/09822bb7d471aa8f15fb78b2f4c14f7a.jpg'
  ],
=======
    'https://i.pinimg.com/originals/09/82/2b/09822bb7d471aa8f15fb78b2f4c14f7a.jpg'],
>>>>>>> f92a271447e1bee5860f808b2129f6798a1abd11

  'soundproof room' => [
    'https://images.easytechjunkie.com/soundproof-room.jpg',
    'https://www.tomorrowsleep.com/wp-content/uploads/2019/01/How-To-Soundproof-A-Bedroom-1.jpg',
    'https://www.grooveboxstudios.com/wp-content/uploads/2020/01/soundproof-room-activites.jpg',
<<<<<<< HEAD
    'https://thenewsvoice.com/wp-content/uploads/2021/03/MMTacustix.jpeg'
  ],
=======
    'https://thenewsvoice.com/wp-content/uploads/2021/03/MMTacustix.jpeg'],
>>>>>>> f92a271447e1bee5860f808b2129f6798a1abd11
  'living room' => [
    'https://i.pinimg.com/originals/55/4e/10/554e100eab2b21c73036669b1a85493d.jpg',
    'https://i.pinimg.com/originals/ca/80/24/ca8024cfe8c4496131be3d86e6afa009.jpg',
    'https://storage.googleapis.com/gen-atmedia/2/2016/02/4bdd18e9b5a9e39b39cd1b476f1c87dad11404b0.jpeg',
    'https://i.pinimg.com/originals/d5/4b/1e/d54b1e15150823f92940ba9792ca0c41.jpg',
    'https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1560366499000/photosp/98f094ae-e218-436f-99a4-c0653decce47/stock-photo-wall-guitar-living-room-home-collection-couch-natural-light-electric-guitar-guitars-98f094ae-e218-436f-99a4-c0653decce47.jpg'
<<<<<<< HEAD
  ],
  'bathroom' => [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqI74LpzAhL44nSBmgwb4tzDOm7WziJasSgA&usqp=CAU',
    'https://st.hzcdn.com/simgs/pictures/bathrooms/guitar-sink-castletech-inc-img~7cc11463040794d4_4-2720-1-df3f83c.jpg',
    'https://i.redd.it/0o5m1nsjpof01.jpg'
  ]
}
=======
  ] ,
  'bathroom'=> [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqI74LpzAhL44nSBmgwb4tzDOm7WziJasSgA&usqp=CAU',
    'https://st.hzcdn.com/simgs/pictures/bathrooms/guitar-sink-castletech-inc-img~7cc11463040794d4_4-2720-1-df3f83c.jpg',
    'https://i.redd.it/0o5m1nsjpof01.jpg'
  ]}
>>>>>>> f92a271447e1bee5860f808b2129f6798a1abd11
types = photos.keys
counter = 0
10.times do
  user = User.create(email: Faker::Internet.email, password: 123_456)
  rand(0..2).times do
    place = places.sample(1)[0]
    adj = adjectives.sample(1)[0]
    type = types.sample(1)[0]
    studio = Studio.new(
      name: "#{adj} #{type} in #{place}",
      address: "#{Faker::Address.street_address}, #{place}",
      description: "#{adj} #{type}. #{descriptions.sample(1)[0]}.",
<<<<<<< HEAD
      price: rand(5..100) * 100
=======
      price: rand(5..100)*100
>>>>>>> f92a271447e1bee5860f808b2129f6798a1abd11
    )
    studio.user = user
    file = URI.open(photos[type].sample(1)[0])
    studio.photo.attach(io: file, filename: "studio_#{counter}.png", content_type: 'image/png')
    studio.save
    counter += 1
  end
end
