# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User Seeds for the team

TEAM = [['patrick', 'campbell'],['yoshiki', 'bell'],['jocelyn', 'yuan']]
GEEZERS = [['doug', 'berkley'], ['trouni', 'tiet'], ['yann','klein']]
SHOPPING = ['Amazon', 'Rakuten', 'Itoyokodo']
SHOPPINGLIST = ['milk', 'honey', 'whiskey', 'eggs', 'maguro sashimi', 'tofu', 'rice', 'apples', 'kiwi', 'tonic water' ]
puts 'Destroying all Seeds..'

Button.delete_all
ProviderAction.delete_all
User.delete_all
Provider.delete_all





puts 'Making Provider Seeds'

SHOPPING.each do |provider|
  Provider.create!(name: provider,
                   tag_list: "Shopping" )
end
puts "Made some providers!"

puts "Making user/geezer Seeds"

3.times do |i|
  tmp_user = User.create!(first_name: TEAM[i][0],
                          last_name:[i][1],
                          email:"#{TEAM[i][0]}@carebridge.us",
                          password: '123123',
                          username: TEAM[i][0])

  tmp_geezer = User.create!(first_name: GEEZERS[i][0],
                            last_name:[i][1],
                            email:"#{GEEZERS[i][0]}@carebridge.us",
                            password: '123123',
                            username: GEEZERS[i][0],
                            caregiver_id: tmp_user.id)
  Provider.all.each do |provider|
    Button.create!(user: tmp_geezer,
                   provider: provider,
                   name: provider.name)
    SHOPPINGLIST.each do |item|
      ProviderAction.create!(quantity: rand(1..5),
                             name: item,
                             provider: provider,
                             disabled: [true, false].sample,
                             user: tmp_geezer )

    end
  end
end



puts 'Making some shit for geezer to push, provideractions!'
