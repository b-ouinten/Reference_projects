# Destroy all tables and reset the counter of ID to zero
Rails.application.eager_load!
ApplicationRecord.descendants.each { |model|
  unless model == Account
    model.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
    puts "The table #{model.table_name} has been deleted !"
  end
}

# Fill with some records
account = Account.first
city = City.create! name:'Paris'
Category.create!(name: 'Business').tap do |root|
  10.times do |index|
    root.children.create!(parent: root, name: "#{root.name}.child_#{index}").tap do |child|
      10.times do |i|
        child.children.create!(name: "#{child.name}.grandchild_#{i}").tap do |grandchild|
          100.times do
            grandchild.adverts.create!(title:Faker::Lorem.sentence(word_count: 3), 
                                      description:Faker::Lorem.paragraph(sentence_count: 3),
                                      account: account,
                                      city: city)
          end
        end
      end
    end
  end
end