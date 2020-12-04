# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed our database by some records
# Before anything, delete all records from each tables
# and reset primary key sequence in order to start again from 1
Rails.application.eager_load!
ApplicationRecord.descendants.each { |model|
  model.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
}

# Create 5 users
5.times { |index|
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote, email: "user_#{index}@yopmail.com", password: 'wazo12')
}

# Create 10 events
10.times { |index|
  Event.create!(
    title: Faker::Hacker.adjective,
    description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
    start_date: Time.now + 24 * 60 * 60 * index,
    duration: Faker::Number.within(range: 6..24) * 5,
    price: Faker::Number.within(range: 1..1000),
    location: Faker::Address.city,
    admin_id: Faker::Number.within(range: 1..5)
  )
}