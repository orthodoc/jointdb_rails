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
category1 = Category.create(:name => 'Manufacturer1')
puts 'New category created: ' << category1.name
category2 = Category.create(:name => 'Manufacturer2')
puts 'New category created: ' << category2.name

puts 'SETTING UP DEFAULT COMPANIES'
company1 = Company.create(:name => 'Smart Ortho1', :category_id => 1)
puts 'New company created: ' << company1.name
company2 = Company.create(:name => 'Smart Ortho2', :category_id => 1)
puts 'New company created: ' << company2.name
company3 = Company.create(:name => 'Smart Ortho3', :category_id => 2)
puts 'New company created: ' << company3.name
company4 = Company.create(:name => 'Smart Ortho4', :category_id => 2)
puts 'New company created: ' << company4.name
