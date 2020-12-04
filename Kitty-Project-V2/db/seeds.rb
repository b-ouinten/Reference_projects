# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Rails.application.eager_load!
# ApplicationRecord.descendants.each { |model|
#     model.destroy_all
#     ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
# }

CartItem.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(CartItem.table_name)
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Category.table_name)
OrderItem.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(OrderItem.table_name)
Order.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Order.table_name)

Category.create(name: 'Abyssin')
Category.create(name: 'Bengal')
Category.create(name: 'Ceylan')
Category.create(name: 'Chausie')
Category.create(name: 'Donskoy')
Category.create(name: 'Korat')
Category.create(name: 'LaPerm')
Category.create(name: 'Ocicat')
Category.create(name: 'Persan')
Category.create(name: 'Siamois')