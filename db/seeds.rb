# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "TestUser", password: 'Test123', password_confirmation: 'Test123', admin: true)

49.times do |n|
  name = "TestUser#{n+1}"
  password = "Test123"
  User.create!(name: name, password: password, password_confirmation: password)
end

users = User.order(:created_at).take(6)
49.times do
  message = Faker::Lorem.sentence(5)
  receiver = 1
  users.each {|user| user.chat_pms.create!(message: message, receiver: receiver)}
end
