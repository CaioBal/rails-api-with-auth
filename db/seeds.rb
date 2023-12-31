# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
User.destroy_all

user = User.create!(
    email: "user@user.com", 
    password: "password", 
    password_confirmation: "password")

user1 = User.create!(
    email: "user1@user.com", 
    password: "password", 
    password_confirmation: "password")

10.times do |index|
    Item.create!(
        name: Faker::Lorem.sentence,
        description: Faker::Lorem.sentence,
        user: [user, user1].sample
    )
end

puts "User -> #{user.email}"
puts "Created #{Item.count} items"