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
Granny.destroy_all

# Create users
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

# Create grannies
grannies_data = [
  {
    name: "Dorothy",
    bio: "Former teacher who loves bedtime stories and baking cookies. Great with kids!",
    price: 25,
    location: "Portland, OR",
    available: true,
    user_id: 1
  },
  {
    name: "Margaret",
    bio: "Retired nurse with a gentle touch. Expert at soothing scraped knees.",
    price: 30,
    location: "Seattle, WA",
    available: true,
    user_id: 2
  },
  {
    name: "Rose",
    bio: "Energetic granny who loves nature walks and arts & crafts.",
    price: 35,
    location: "Denver, CO",
    available: false,
    user_id: 3
  },
  {
    name: "Helen",
    bio: "Music lover who plays piano and tells wonderful fairy tales.",
    price: 28,
    location: "Austin, TX",
    available: true,
    user_id: 4
  },
  {
    name: "Betty",
    bio: "Former librarian who loves reading and homework help. Speaks 3 languages!",
    price: 32,
    location: "Chicago, IL",
    available: true,
    user_id: 5
  },
  {
    name: "Ruth",
    bio: "Crafty grandmother who teaches quilting and has a great sense of humor.",
    price: 26,
    location: "Nashville, TN",
    available: false,
    user_id: 6
  },
  {
    name: "Alice",
    bio: "Retired chef who makes every meal special and teaches cooking.",
    price: 40,
    location: "San Francisco, CA",
    available: true,
    user_id: 7
  },
  {
    name: "Mary",
    bio: "Bilingual granny who enjoys cultural activities and celebrations.",
    price: 29,
    location: "Phoenix, AZ",
    available: true,
    user_id: 8
  },
  {
    name: "Virginia",
    bio: "Active grandmother who loves sports and organizing fun group activities.",
    price: 33,
    location: "Miami, FL",
    available: false,
    user_id: 9
  },
  {
    name: "Frances",
    bio: "Gentle granny who specializes in emotional support and art projects.",
    price: 31,
    location: "Boston, MA",
    available: true,
    user_id: 10
  }
]

puts "Creating #{users_data.length} users..."

# Create users
users_data.each do |user_attrs|
  user = User.create!(user_attrs)
  puts "Created user: #{user.email}"
end

# Create grannies
grannies_data.each do |granny_attrs|
  Granny.create!(granny_attrs)
end

puts "Created #{Granny.count} grannies"

puts "Seeding completed! #{User.count} users in database."
