# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User Seeds for the team

require 'open-uri'

TEAM = [['patrick', 'campbell'],['yoshiki', 'bell'],['jocelyn', 'yuan']]
GEEZERS = [['doug', 'berkley'], ['trouni', 'tiet'], ['yann','klein']]
SHOPPING = ['Amazon', 'Rakuten', 'Ito Yokado']
SHOPPINGLIST = ['Milk', 'Honey', 'Eggs', 'Tofu', 'Rice', 'Apples']
puts 'Destroying all Seeds..'

Button.delete_all
OrderItem.delete_all
Order.delete_all
ProviderAction.delete_all
User.delete_all
Provider.delete_all





# puts 'Making Provider Seeds'

# SHOPPING.each do |provider|
#   Provider.create!(name: provider,
#                    tag_list: "Shopping" )
# end

# puts "Made some providers!"

# puts "Making user/geezer Seeds"

# 3.times do |i|
#   tmp_user = User.create!(first_name: TEAM[i][0],
#                           last_name: TEAM[i][1],
#                           email:"#{TEAM[i][0]}@carebridge.us",
#                           password: '123123',
#                           username: TEAM[i][0])

#   tmp_geezer = User.create!(first_name: GEEZERS[i][0],
#                             last_name:GEEZERS[i][1],
#                             email:"#{GEEZERS[i][0]}@carebridge.us",
#                             password: '123123',
#                             username: GEEZERS[i][0],
#                             caregiver_id: tmp_user.id)
#   Provider.all.each do |provider|
#     Button.create!(user: tmp_geezer,
#                    provider: provider,
#                    name: provider.name)
#     SHOPPINGLIST.each do |item|
#       ProviderAction.create!(quantity: rand(1..5),
#                              name: item,
#                              provider: provider,
#                              disabled: [true, false].sample,
#                              user: tmp_geezer )

#     end
#   end
# end

# puts "Adding voice chat button"
# ft = Provider.create!(name: "FaceTime",
#                       tag_list: "communication" )

# geezers = User.where.not(caregiver: nil)
# geezers.each do |geezer|
#   ProviderAction.create!(name: "Call #{geezer.caregiver.first_name}",
#                          provider: ft,
#                          user: geezer )
# end


# puts 'Making some shit for geezer to push, provideractions!'



# Everything below is for pitch seeds
puts "Creating Jocelyn!"

jocelyn = User.create!(first_name: "jocelyn",
                       last_name: "yuan",
                       email:"jocelyn@carebridge.us",
                       password: '123123',
                       username: "jocelyn")
puts "made!  Now on to the real test.  Grandpa!"
grandpa = User.new(first_name: "bob",
                   last_name:"yuan",
                   email:"bob@carebridge.us",
                   password: '123123',
                   username: "bob",
                   caregiver_id: jocelyn.id)



file = URI.open("https://image-resizer.cwg.tw/resize/uri/https%3A%2F%2Fstorage.googleapis.com%2Fwww-cw-com-tw%2Farticle%2F201905%2Farticle-5ccc215628e3a.jpg/?w=1600")
grandpa.photo.attach(io: file, filename: 'grandpa.jpg', content_type: 'image/jpg')

puts "sweet, photo attached!"


puts "Creating groceries"
groceries = Provider.create!(name: "groceries",
                             tag_list: "Shopping")






file = URI.open("https://i.pinimg.com/originals/f6/db/eb/f6dbeb17951cb9d12c450eb26e42e484.jpg")
shopping_btn = Button.create!(user: grandpa,
                              provider: groceries,
                              name: "Groceries" )
shopping_btn.photo.attach(io: file, filename: 'amazon.jpg', content_type: 'image/jpg')

#Creating Factime provider and buttons

puts "Adding voice chat button"
facetime = Provider.create!(name: "FaceTime",
                            tag_list: "communication" )

familyjoc = ["Mickey", "Vivian", "Jocelyn"]

familyjoc.each do |person|
  ProviderAction.create!(name: "#{person}",
                         provider: facetime,
                         user: grandpa,
                         enabled: true)
end



puts "Adding emergency button"
emergency = Provider.create!(name: "Emergency",
                             tag_list: "SOS" )
puts "Adding taxi button"
taxi = Provider.create!(name: "Taxi",
                        tag_list: "transportation" )
puts "Adding food_delivery button"
food_delivery = Provider.create!(name: "Food delivery",
                                 tag_list: "delivery" )



file = URI.open("https://hackernoon.com/hn-images/1*3462gy-_U_FrHlMf0o-dow.png")
videochat = Button.create!(user: grandpa,
                           provider: facetime,
                           name: "Video Chat")

videochat.photo.attach(io: file, filename: 'vc.png', content_type: 'image/png')
