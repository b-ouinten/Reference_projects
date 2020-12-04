# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# --- Seed database ---
Dogsitter.destroy_all
Dog.destroy_all
City.destroy_all

3.times do |index|
  city = City.create(name: "city_#{index}")
  dogsitter = Dogsitter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                              age: Faker::Number.between(from: 20, to: 60))
  2.times do |index|
    dog = Dog.create(name: Faker::Name.first_name)
    Stroll.create(dogsitter: dogsitter, dog: dog, city: city)
    2.times do |index|  
      dogsitter = Dogsitter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
        age: Faker::Number.between(from: 20, to: 60))
      Stroll.create(dogsitter: dogsitter, dog: dog, city: city)
    end
  end
end
    
tp Stroll.all