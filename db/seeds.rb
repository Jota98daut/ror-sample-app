# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(username: 'Joel',
             email: 'joel@bootcamp.org',
             password: 'foobar',
             password_confirmation: 'foobar')

10.times do |n|
  username = Faker::Name.first_name
  email = "example-#{n + 1}@bootcamp.com"
  password = 'password'
  User.create!(username:,
               email:,
               password:,
               password_confirmation: password)
end

# Generate microposts for a subset of users
users = User.take(6)

50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content:) }
end
