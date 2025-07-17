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
# Create a new user
user1 = User.create!(
  email: "yuki@example.com",
  password: "password123",
  password_confirmation: "password123"
)

# Create a granny for this user
granny1 = Granny.create!(
  name: "Yuki Tanaka",
  bio: "Traditional tea ceremony master from Kyoto. I teach origami and love sharing Japanese culture with guests.",
  price: 85,
  location: "Kyoto, Japan",
  available: true,
  category: "crafters",
  stats_speed: 4,
  stats_health: 8,
  stats_wisdom: 9,
  stats_teeth: 7,
  superhost: true,
  rating: 5,
  review_count: 23,
  age: 72,
  user_id: user1.id
)

puts "Created user: #{user1.email}"
puts "Created granny: #{granny1.name} with stats: Speed=#{granny1.stats_speed}, Health=#{granny1.stats_health}, Wisdom=#{granny1.stats_wisdom}, Teeth=#{granny1.stats_teeth}"

# puts "Creating #{users_data.length} users..."

# Create users and store them
created_users = []
users_data.each do |user_attrs|
  user = User.create!(user_attrs)
  created_users << user
  puts "Created user: #{user.email}"
end

# Create grannies using actual user IDs and attach images
grannies_data.each_with_index do |granny_attrs, index|
  #Use the actual created user (index matches the user we want)
  granny_attrs[:user_id] = created_users[index].id
  granny = Granny.create!(granny_attrs)

  # Attach photo to the granny
  file_path = Rails.root.join('app', 'assets', 'images', 'grannies', "Granny-#{index + 1}.svg")

  if File.exist?(file_path)
    # Open the file and attach it - this will trigger Cloudinary upload
    File.open(file_path) do |file|
      granny.image.attach(
        io: file,
        filename: "Granny-#{index + 1}.svg",
        content_type: 'image/svg+xml'
      )
    end

    # Wait a moment for the upload to complete
    sleep(0.5)

    puts "✅ Attached and uploaded photo to #{granny.name}"
  else
    puts "❌ Photo not found for #{granny.name}: #{file_path}"
  end
end
