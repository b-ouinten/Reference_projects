# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ---------------------------------------------------------------------
# --- Seed our database by some records ---
# --- Before anything, delete all records from each tables ---
# --- and reset primary key sequence in order to start again from 1 ---
Rails.application.eager_load!
ApplicationRecord.descendants.each { |model|
  model.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
}

# --- Create Algeria wilayas ---
algeria_wilayas = [
  ["1","Adrar"],
  ["2","Chlef"],
  ["3","Laghouat"],
  ["4","Oum El Bouaghi"],
  ["5","Batna"],
  ["6","Béjaïa"],
  ["7","Biskra"],
  ["8","Béchar"],
  ["9","Blida"],
  ["10","Bouira"],
  ["11","Tamanrasset"],
  ["12","Tébessa"],
  ["13","Tlemcen"],
  ["14","Tiaret"],
  ["15","Tizi Ouzou"],
  ["16","Alger"],
  ["17","Djelfa"],
  ["18","Jijel"],
  ["19","Sétif"],
  ["20","Saïda"],
  ["21","Skikda"],
  ["22","Sidi Bel Abbès"],
  ["23","Annaba"],
  ["24","Guelma"],
  ["25","Constantine"],
  ["26","Médéa"],
  ["27","Mostaganem"],
  ["28","M'Sila"],
  ["29","Mascara"],
  ["30","Ouargla"],
  ["31","Oran"],
  ["32","El Bayadh"],
  ["33","Illizi"],
  ["34","Bordj Bou Arreridj"],
  ["35","Boumerdès"],
  ["36","El Tarf"],
  ["37","Tindouf"],
  ["38","Tissemsilt"],
  ["39","El Oued"],
  ["40","Khenchela"],
  ["41","Souk Ahras"],
  ["42","Tipaza"],
  ["43","Mila"],
  ["44","Aïn Defla"],
  ["45","Naâma"],
  ["46","Aïn Témouchent"],
  ["47","Ghardaïa"],
  ["48","Relizane"]
].each { |item|
  City.create(zip_code: item[0], name: item[1])
}  


# # Generate 10 cities
# 10.times do
#   City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
# end

# Generate 3 users
3.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.most_interesting_man_in_the_world, email: Faker::Internet.email, age: Faker::Number.within(range: 1..48), city_id: Faker::Number.within(range: 1..10), password: 'wazo6556')
end

# Generate 20 gossips
5.times do
  Gossip.create!(title: Faker::Hacker.adjective, content: Faker::Hacker.say_something_smart, user_id: Faker::Number.within(range: 1..3))
end

# # Generate 10 tags
# 10.times do
#   Tag.create!(title: Faker::Hacker.abbreviation)
# end

# # Generate 10 relations tag/gossip
# 10.times do
#   GossipsTag.create!(tag_id: Faker::Number.within(range: 1..10), gossip_id: Faker::Number.within(range: 1..20))
# end

# Generate 10 comments
10.times do
  Comment.create(content: Faker::Hacker.say_something_smart, gossip_id: Faker::Number.within(range: 1..5), user_id: Faker::Number.within(range: 1..3))
end