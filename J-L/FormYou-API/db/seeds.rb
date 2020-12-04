User.delete_all
Room.destroy_all
Role.destroy_all
Formation.destroy_all
FormationSession.destroy_all
FormationAttendance.destroy_all
Category.destroy_all
FormationCategory.destroy_all

User.reset_pk_sequence
Room.reset_pk_sequence
Role.reset_pk_sequence
Formation.reset_pk_sequence
FormationSession.reset_pk_sequence
FormationAttendance.reset_pk_sequence
Category.reset_pk_sequence
FormationCategory.reset_pk_sequence

require 'faker'

Role.create(name: "student")
Role.create(name: "admin")
Role.create(name: "teacher")


10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    age: rand(18..99),
    password: "azerty",
    role:  Role.first,
    is_validated: true
  )
  user.save
  puts "user #{user.id} created"
end

User.create(
  first_name: "admin",
  last_name: "admin",
  email: "admin@yopmail.com",
  age: rand(18..99),
  password: "azerty",
  role:  Role.find_by(name: "admin"),
  is_validated: true
)

User.create(
  first_name: "teacher",
  last_name: "teacher",
  email: "teacher@yopmail.com",
  age: rand(35..99),
  password: "azerty",
  role:  Role.last,
  is_validated: true
)




10.times do
 Formation.create(title: "Super formation",  description:Faker::Lorem.words(number: 20), teacher_id: User.last.id)
end 


10.times do |i|
  Room.create(name: "Room formation #{i}")
end 



10.times do |i|
  FormationSession.create(room:Room.all.sample, formation:Formation.all.sample, start_date:Time.now, end_date:Time.now + 3600*24, capacity:rand(1..20))
end 

10.times do |i|
  FormationAttendance.create(user:User.all.sample, formation:Formation.all.sample, formation_session:FormationSession.all.sample)
end 


10.times do |i|
  Category.create(name:"category test #{i}")
end 

10.times do |i|
  FormationCategory.create(category:Category.all.sample, formation:Formation.all.sample)
end