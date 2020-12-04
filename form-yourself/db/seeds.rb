# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Profile.delete_all
User.delete_all
CategoryTraining.delete_all
Category.delete_all
Training.delete_all
Classroom.delete_all
Session.delete_all
SessionParticipation.delete_all

5.times do
  user = User.create! email: Faker::Internet.email, password: 'password'
  profile = Profile.create! first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, profile_type: 'student', user_id: user.id
end

3.times do
  user = User.create! email: Faker::Internet.email, password: 'password'
  profile = Profile.create! first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, profile_type: 'teacher', user_id: user.id
end

user = User.create! email: Faker::Internet.email, password: 'password'
profile = Profile.create! first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, profile_type: 'admin', user_id: user.id

3.times do
  category = Category.create! title: Faker::Book.genre
  4.times do
    training = Training.create! title: Faker::Book.title,
    description: Faker::Movies::HarryPotter.quote,
    teacher_id: Profile.select { |profile| profile.profile_type === 'teacher' }.sample.user_id

    category_training = CategoryTraining.create! category: category, training: training
  end
end

i = 1
6.times do
  classroom = Classroom.create! room_code: "room#{i}"
  i += 1
end

10.times do
  Session.create! session_date:Faker::Date.between(from: '2020-12-01', to: '2020-12-31'),
    training_id: Training.all.sample.id,
    classroom_id: Classroom.all.sample.id
end

20.times do
  SessionParticipation.create! student_id: Profile.select { |p| p.profile_type === 'student' }.sample.user_id,
  session_id: Session.all.sample.id
end