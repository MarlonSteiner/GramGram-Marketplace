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
  # Admin and existing users
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
  },
  # Additional host users (users 11-21 will own grannies)
  {
    email: "sarah.white@example.com",
    password: "password123",
    first_name: "Sarah",
    last_name: "White"
  },
  {
    email: "mike.garcia@example.com",
    password: "password123",
    first_name: "Mike",
    last_name: "Garcia"
  },
  {
    email: "linda.martinez@example.com",
    password: "password123",
    first_name: "Linda",
    last_name: "Martinez"
  },
  {
    email: "david.rodriguez@example.com",
    password: "password123",
    first_name: "David",
    last_name: "Rodriguez"
  },
  {
    email: "nancy.lewis@example.com",
    password: "password123",
    first_name: "Nancy",
    last_name: "Lewis"
  },
  {
    email: "paul.walker@example.com",
    password: "password123",
    first_name: "Paul",
    last_name: "Walker"
  },
  {
    email: "karen.hall@example.com",
    password: "password123",
    first_name: "Karen",
    last_name: "Hall"
  },
  {
    email: "mark.allen@example.com",
    password: "password123",
    first_name: "Mark",
    last_name: "Allen"
  },
  {
    email: "donna.young@example.com",
    password: "password123",
    first_name: "Donna",
    last_name: "Young"
  },
  {
    email: "steven.king@example.com",
    password: "password123",
    first_name: "Steven",
    last_name: "King"
  },
  {
    email: "carol.wright@example.com",
    password: "password123",
    first_name: "Carol",
    last_name: "Wright"
  },
  # Customer-only users (users 22-30 will not own grannies)
  {
    email: "emma.thompson@example.com",
    password: "password123",
    first_name: "Emma",
    last_name: "Thompson"
  },
  {
    email: "james.wilson@example.com",
    password: "password123",
    first_name: "James",
    last_name: "Wilson"
  },
  {
    email: "olivia.moore@example.com",
    password: "password123",
    first_name: "Olivia",
    last_name: "Moore"
  },
  {
    email: "william.clark@example.com",
    password: "password123",
    first_name: "William",
    last_name: "Clark"
  },
  {
    email: "sophia.lee@example.com",
    password: "password123",
    first_name: "Sophia",
    last_name: "Lee"
  },
  {
    email: "benjamin.harris@example.com",
    password: "password123",
    first_name: "Benjamin",
    last_name: "Harris"
  },
  {
    email: "isabella.martin@example.com",
    password: "password123",
    first_name: "Isabella",
    last_name: "Martin"
  },
  {
    email: "lucas.jackson@example.com",
    password: "password123",
    first_name: "Lucas",
    last_name: "Jackson"
  },
  {
    email: "mia.white@example.com",
    password: "password123",
    first_name: "Mia",
    last_name: "White"
  }
]

# Create grannies (without image attributes since using Active Storage)
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
  },
  {
    name: "Eleanor",
    bio: "Former social worker who loves organizing community events and volunteering.",
    price: 27,
    location: "Atlanta, GA",
    available: true,
    user_id: 11
  },
  {
    name: "Joyce",
    bio: "Retired artist who teaches painting and loves creative expression.",
    price: 34,
    location: "New York, NY",
    available: true,
    user_id: 12
  },
  {
    name: "Patricia",
    bio: "Former pediatrician who has a special way with anxious children.",
    price: 45,
    location: "Los Angeles, CA",
    available: false,
    user_id: 13
  },
  {
    name: "Barbara",
    bio: "Retired school principal who loves structure and educational activities.",
    price: 38,
    location: "Philadelphia, PA",
    available: true,
    user_id: 14
  },
  {
    name: "Sandra",
    bio: "Former travel agent who shares amazing stories from around the world.",
    price: 30,
    location: "San Diego, CA",
    available: true,
    user_id: 15
  },
  {
    name: "Donna",
    bio: "Retired veterinarian who loves animals and teaches kids about pet care.",
    price: 36,
    location: "Dallas, TX",
    available: false,
    user_id: 16
  },
  {
    name: "Carol",
    bio: "Former seamstress who teaches sewing and loves making handmade gifts.",
    price: 24,
    location: "San Antonio, TX",
    available: true,
    user_id: 17
  },
  {
    name: "Ruth Ann",
    bio: "Retired pharmacist who's great at explaining how things work.",
    price: 35,
    location: "Phoenix, AZ",
    available: true,
    user_id: 18
  },
  {
    name: "Linda",
    bio: "Former dance instructor who teaches rhythm and loves musical games.",
    price: 32,
    location: "San Jose, CA",
    available: false,
    user_id: 19
  },
  {
    name: "Susan",
    bio: "Retired journalist who loves storytelling and encouraging young writers.",
    price: 29,
    location: "Columbus, OH",
    available: true,
    user_id: 20
  },
  {
    name: "Deborah",
    bio: "Former therapist who specializes in mindfulness and emotional wellness for kids.",
    price: 42,
    location: "Fort Worth, TX",
    available: true,
    user_id: 21
  }
]

puts "Creating #{users_data.length} users..."

# Create users and store them
created_users = []
users_data.each do |user_attrs|
  user = User.create!(user_attrs)
  created_users << user
  puts "Created user: #{user.email}"
end

# Create grannies using actual user IDs
grannies_data.each_with_index do |granny_attrs, index|
  # Use the actual created user (index matches the user we want)
  granny_attrs[:user_id] = created_users[index].id
  Granny.create!(granny_attrs)
end

puts "Created #{Granny.count} grannies"

puts "Seeding completed! #{User.count} users in database."
