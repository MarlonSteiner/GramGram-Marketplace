# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all

# Create sample users
users_data = [
  {
    email: "admin@example.com",
    password: "password123",
    first_name: "Admin",
    last_name: "User"
  },
  {
    email: "john.doe@example.com",
    password: "password123",
    first_name: "John",
    last_name: "Doe"
  },
  {
    email: "jane.smith@example.com",
    password: "password123",
    first_name: "Jane",
    last_name: "Smith"
  },
  {
    email: "bob.johnson@example.com",
    password: "password123",
    first_name: "Bob",
    last_name: "Johnson"
  },
  {
    email: "alice.brown@example.com",
    password: "password123",
    first_name: "Alice",
    last_name: "Brown"
  },
  {
    email: "charlie.wilson@example.com",
    password: "password123",
    first_name: "Charlie",
    last_name: "Wilson"
  },
  {
    email: "diana.davis@example.com",
    password: "password123",
    first_name: "Diana",
    last_name: "Davis"
  },
  {
    email: "frank.miller@example.com",
    password: "password123",
    first_name: "Frank",
    last_name: "Miller"
  },
  {
    email: "grace.taylor@example.com",
    password: "password123",
    first_name: "Grace",
    last_name: "Taylor"
  },
  {
    email: "henry.anderson@example.com",
    password: "password123",
    first_name: "Henry",
    last_name: "Anderson"
  }
]

puts "Creating #{users_data.length} users..."

users_data.each do |user_attrs|
  user = User.create!(user_attrs)
  puts "Created user: #{user.email}"
end

puts "Seeding completed! #{User.count} users in database."
