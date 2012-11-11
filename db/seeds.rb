# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2.name
user.add_role :admin

puts 'SETTING UP DEFAULT CATEGORIES'
category1 = Category.create(:name => 'Manufacturer')
puts 'New category created: ' << category1.name
category2 = Category.create(:name => 'Organization')
puts 'New category created: ' << category2.name
category3 = Category.create(:name => 'Distributor')
puts 'New category created: ' << category3.name
category4 = Category.create(:name => 'Other')
puts 'New category created: ' << category4.name
