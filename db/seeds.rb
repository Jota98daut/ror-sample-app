# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create an user 
User.create!(username: 'Joel',
             email: 'joel@railstutorial.org',
             password: 'password',
             password_confirmation: 'password')

10.times do |n|
  username = Faker::Name.first_name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(username:,
               email:,
               password:,
               password_confirmation: password)
end

# Generate some platforms

%w[Facebook Instagram Twitter Reddit].each do |name|
  Platform.create!(name:)
end

# Generate microposts for a subset of users

users = User.take(6)
platform = Platform.first

50.times do
  content = Faker::Lorem.sentence(word_count: 5)

  users.each { |user| user.microposts.create!(content:, platform:) }
end
