# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Granny.destroy_all

puts "Creating category owners..."

# Create 6 category owners (one per category)
cat_lover_owner = User.create!(
  email: "catlover@gramgram.com",
  password: "password123",
  password_confirmation: "password123"
)

chef_owner = User.create!(
  email: "chef@gramgram.com",
  password: "password123",
  password_confirmation: "password123"
)

healer_owner = User.create!(
  email: "healer@gramgram.com",
  password: "password123",
  password_confirmation: "password123"
)

adventurer_owner = User.create!(
  email: "adventurer@gramgram.com",
  password: "password123",
  password_confirmation: "password123"
)

crafter_owner = User.create!(
  email: "crafter@gramgram.com",
  password: "password123",
  password_confirmation: "password123"
)

booklover_owner = User.create!(
  email: "booklover@gramgram.com",
  password: "password123",
  password_confirmation: "password123"
)

puts "Created 6 category owners"

# Create grannies data - 8 per category
grannies_data = [
  # Cat Lovers (8 grannies) - all owned by cat_lover_owner
  {
    name: "Yuki Sato", location: "Tokyo, Japan", price: 75, category: "cat-lovers",
    bio: "Cat lover from Japan who has rescued many street cats. I teach origami and love sharing stories.",
    available: true, stats_speed: 3, stats_health: 8, stats_wisdom: 9, stats_teeth: 6,
    superhost: true, rating: 4, review_count: 0, age: 72, user_id: cat_lover_owner.id
  },
  {
    name: "Hana Fujii", location: "Osaka, Japan", price: 85, category: "cat-lovers",
    bio: "Retired veterinarian with 8 rescue cats named after constellations.",
    available: true, stats_speed: 4, stats_health: 7, stats_wisdom: 8, stats_teeth: 7,
    superhost: false, rating: 5, review_count: 0, age: 68, user_id: cat_lover_owner.id
  },
  {
    name: "Akiko Yamada", location: "Kyoto, Japan", price: 95, category: "cat-lovers",
    bio: "Former cat café owner who speaks to cats in 3 languages.",
    available: true, stats_speed: 5, stats_health: 9, stats_wisdom: 10, stats_teeth: 8,
    superhost: true, rating: 5, review_count: 0, age: 75, user_id: cat_lover_owner.id
  },
  {
    name: "Michiko Ito", location: "Hiroshima, Japan", price: 105, category: "cat-lovers",
    bio: "Cat behaviorist who has written 3 books about feline psychology.",
    available: true, stats_speed: 3, stats_health: 8, stats_wisdom: 9, stats_teeth: 6,
    superhost: true, rating: 4, review_count: 0, age: 70, user_id: cat_lover_owner.id
  },
  {
    name: "Emiko Suzuki", location: "Nagoya, Japan", price: 115, category: "cat-lovers",
    bio: "Professional cat photographer who has exhibited in galleries worldwide.",
    available: true, stats_speed: 4, stats_health: 7, stats_wisdom: 8, stats_teeth: 7,
    superhost: false, rating: 5, review_count: 0, age: 73, user_id: cat_lover_owner.id
  },
  {
    name: "Dolores Thompson", location: "Sydney, Australia", price: 98, category: "cat-lovers",
    bio: "Retired vet with 12 cats. I offer pet therapy sessions and knitting circles.",
    available: true, stats_speed: 4, stats_health: 7, stats_wisdom: 8, stats_teeth: 7,
    superhost: true, rating: 5, review_count: 0, age: 74, user_id: cat_lover_owner.id
  },
  {
    name: "Rosa Martinez", location: "Barcelona, Spain", price: 88, category: "cat-lovers",
    bio: "Former circus animal trainer who now rehabilitates street cats.",
    available: true, stats_speed: 6, stats_health: 8, stats_wisdom: 7, stats_teeth: 6,
    superhost: false, rating: 4, review_count: 0, age: 69, user_id: cat_lover_owner.id
  },
  {
    name: "Chen Wei", location: "Beijing, China", price: 92, category: "cat-lovers",
    bio: "Traditional Chinese medicine practitioner who treats cats and teaches meditation.",
    available: true, stats_speed: 3, stats_health: 9, stats_wisdom: 10, stats_teeth: 5,
    superhost: true, rating: 5, review_count: 0, age: 76, user_id: cat_lover_owner.id
  },

  # Master Chefs (8 grannies) - all owned by chef_owner
  {
    name: "Sakura Nakamura", location: "Tokyo, Japan", price: 110, category: "chefs",
    bio: "Master chef specializing in traditional Japanese cuisine. I teach sushi making and ramen preparation.",
    available: true, stats_speed: 6, stats_health: 9, stats_wisdom: 8, stats_teeth: 9,
    superhost: true, rating: 5, review_count: 0, age: 69, user_id: chef_owner.id
  },
  {
    name: "Keiko Tanaka", location: "Osaka, Japan", price: 125, category: "chefs",
    bio: "3rd generation chef with family recipes passed down for 100+ years.",
    available: true, stats_speed: 5, stats_health: 8, stats_wisdom: 9, stats_teeth: 8,
    superhost: true, rating: 4, review_count: 0, age: 71, user_id: chef_owner.id
  },
  {
    name: "Maria Benedetto", location: "Rome, Italy", price: 140, category: "chefs",
    bio: "Nonna who has been making pasta by hand for 60 years. Family recipes from Tuscany.",
    available: true, stats_speed: 4, stats_health: 8, stats_wisdom: 9, stats_teeth: 9,
    superhost: true, rating: 5, review_count: 0, age: 78, user_id: chef_owner.id
  },
  {
    name: "Françoise Dubois", location: "Lyon, France", price: 155, category: "chefs",
    bio: "Former Michelin-starred chef who teaches classical French cuisine and wine pairing.",
    available: true, stats_speed: 7, stats_health: 9, stats_wisdom: 10, stats_teeth: 8,
    superhost: true, rating: 5, review_count: 0, age: 67, user_id: chef_owner.id
  },
  {
    name: "Lakshmi Patel", location: "Mumbai, India", price: 95, category: "chefs",
    bio: "Spice expert who grew up in her family's spice trade business. Teaches authentic Indian cooking.",
    available: true, stats_speed: 5, stats_health: 8, stats_wisdom: 9, stats_teeth: 7,
    superhost: false, rating: 5, review_count: 0, age: 72, user_id: chef_owner.id
  },
  {
    name: "Carmen Rodriguez", location: "Seville, Spain", price: 118, category: "chefs",
    bio: "Tapas master who learned from her grandmother. Teaches paella and traditional Andalusian dishes.",
    available: true, stats_speed: 6, stats_health: 8, stats_wisdom: 8, stats_teeth: 9,
    superhost: true, rating: 4, review_count: 0, age: 70, user_id: chef_owner.id
  },
  {
    name: "Helen Rodriguez", location: "Mexico City, Mexico", price: 108, category: "chefs",
    bio: "Expert in pre-Hispanic Mexican cuisine. Teaches about ancient ingredients and cooking methods.",
    available: false, stats_speed: 5, stats_health: 7, stats_wisdom: 10, stats_teeth: 6,
    superhost: false, rating: 5, review_count: 0, age: 74, user_id: chef_owner.id
  },
  {
    name: "Amara Okafor", location: "Lagos, Nigeria", price: 102, category: "chefs",
    bio: "Traditional African cuisine expert who teaches about indigenous ingredients and techniques.",
    available: true, stats_speed: 6, stats_health: 9, stats_wisdom: 9, stats_teeth: 8,
    superhost: true, rating: 4, review_count: 0, age: 68, user_id: chef_owner.id
  },

  # Healers (8 grannies) - all owned by healer_owner
  {
    name: "Tomoko Yamamoto", location: "Kyoto, Japan", price: 95, category: "healers",
    bio: "Traditional healer specializing in herbal medicine and acupuncture. I teach meditation and yoga.",
    available: true, stats_speed: 5, stats_health: 10, stats_wisdom: 9, stats_teeth: 7,
    superhost: true, rating: 5, review_count: 0, age: 71, user_id: healer_owner.id
  },
  {
    name: "Grace O'Sullivan", location: "Galway, Ireland", price: 125, category: "healers",
    bio: "Retired physiotherapist and certified yoga master. I offer daily meditation sessions.",
    available: true, stats_speed: 6, stats_health: 10, stats_wisdom: 9, stats_teeth: 7,
    superhost: true, rating: 5, review_count: 0, age: 71, user_id: healer_owner.id
  },
  {
    name: "Priya Sharma", location: "Rishikesh, India", price: 85, category: "healers",
    bio: "Ayurvedic practitioner who has studied traditional Indian medicine for 40 years.",
    available: true, stats_speed: 4, stats_health: 10, stats_wisdom: 10, stats_teeth: 6,
    superhost: true, rating: 5, review_count: 0, age: 75, user_id: healer_owner.id
  },
  {
    name: "Elena Popovich", location: "Sofia, Bulgaria", price: 88, category: "healers",
    bio: "Herbalist who knows 200+ medicinal plants. Teaches natural remedies and forest bathing.",
    available: true, stats_speed: 3, stats_health: 9, stats_wisdom: 10, stats_teeth: 5,
    superhost: false, rating: 4, review_count: 0, age: 77, user_id: healer_owner.id
  },
  {
    name: "Betty Morrison", location: "Cornwall, England", price: 110, category: "healers",
    bio: "Retired nurse specializing in holistic healing. Also a piano teacher who loves music therapy.",
    available: false, stats_speed: 4, stats_health: 7, stats_wisdom: 8, stats_teeth: 5,
    superhost: false, rating: 4, review_count: 0, age: 75, user_id: healer_owner.id
  },
  {
    name: "Sarah Running Bear", location: "Santa Fe, New Mexico", price: 135, category: "healers",
    bio: "Native American healer who practices traditional medicine and teaches about sacred plants.",
    available: true, stats_speed: 5, stats_health: 9, stats_wisdom: 10, stats_teeth: 7,
    superhost: true, rating: 5, review_count: 0, age: 69, user_id: healer_owner.id
  },
  {
    name: "Annika Larsson", location: "Stockholm, Sweden", price: 128, category: "healers",
    bio: "Certified massage therapist specializing in Swedish techniques and sauna therapy.",
    available: true, stats_speed: 6, stats_health: 9, stats_wisdom: 8, stats_teeth: 8,
    superhost: true, rating: 4, review_count: 0, age: 68, user_id: healer_owner.id
  },
  {
    name: "Fatima Al-Zahra", location: "Marrakech, Morocco", price: 92, category: "healers",
    bio: "Traditional Moroccan healer who practices Ruqyah and teaches about medicinal herbs from the Atlas Mountains.",
    available: true, stats_speed: 4, stats_health: 8, stats_wisdom: 9, stats_teeth: 6,
    superhost: false, rating: 5, review_count: 0, age: 73, user_id: healer_owner.id
  },

  # Adventurers (8 grannies) - all owned by adventurer_owner
  {
    name: "Ayako Takahashi", location: "Tokyo, Japan", price: 80, category: "adventurers",
    bio: "World traveler who has visited over 50 countries. I speak multiple languages and love sharing travel stories.",
    available: true, stats_speed: 8, stats_health: 9, stats_wisdom: 10, stats_teeth: 8,
    superhost: true, rating: 5, review_count: 0, age: 73, user_id: adventurer_owner.id
  },
  {
    name: "Kazuko Inoue", location: "Sapporo, Japan", price: 90, category: "adventurers",
    bio: "Former merchant marine captain who sailed the 7 seas for 30 years.",
    available: true, stats_speed: 7, stats_health: 8, stats_wisdom: 9, stats_teeth: 7,
    superhost: true, rating: 4, review_count: 0, age: 69, user_id: adventurer_owner.id
  },
  {
    name: "Dorothy Adventure", location: "Perth, Australia", price: 85, category: "adventurers",
    bio: "Retired airline pilot who has flown to every continent. Teaches navigation and survival skills.",
    available: true, stats_speed: 9, stats_health: 8, stats_wisdom: 9, stats_teeth: 7,
    superhost: true, rating: 5, review_count: 0, age: 69, user_id: adventurer_owner.id
  },
  {
    name: "Isabella Rossi", location: "Venice, Italy", price: 95, category: "adventurers",
    bio: "Former travel photographer who documented indigenous cultures across 6 continents.",
    available: true, stats_speed: 7, stats_health: 8, stats_wisdom: 10, stats_teeth: 8,
    superhost: false, rating: 4, review_count: 0, age: 71, user_id: adventurer_owner.id
  },
  {
    name: "Svetlana Petrov", location: "St. Petersburg, Russia", price: 88, category: "adventurers",
    bio: "Former Arctic explorer who led expeditions to both poles. Teaches cold weather survival.",
    available: true, stats_speed: 8, stats_health: 10, stats_wisdom: 9, stats_teeth: 6,
    superhost: true, rating: 5, review_count: 0, age: 74, user_id: adventurer_owner.id
  },
  {
    name: "Consuela Mendoza", location: "Patagonia, Argentina", price: 92, category: "adventurers",
    bio: "Mountain climbing guide who has summited peaks on every continent.",
    available: true, stats_speed: 9, stats_health: 10, stats_wisdom: 8, stats_teeth: 7,
    superhost: true, rating: 5, review_count: 0, age: 68, user_id: adventurer_owner.id
  },
  {
    name: "Khadija Hassan", location: "Cairo, Egypt", price: 82, category: "adventurers",
    bio: "Desert guide and archaeologist who has led expeditions across the Sahara for 40 years.",
    available: false, stats_speed: 7, stats_health: 8, stats_wisdom: 10, stats_teeth: 6,
    superhost: false, rating: 4, review_count: 0, age: 72, user_id: adventurer_owner.id
  },
  {
    name: "Ingrid Hansen", location: "Bergen, Norway", price: 118, category: "adventurers",
    bio: "Former fishing boat captain who navigated Nordic seas. Teaches sailing and weather reading.",
    available: true, stats_speed: 8, stats_health: 9, stats_wisdom: 9, stats_teeth: 8,
    superhost: true, rating: 4, review_count: 0, age: 70, user_id: adventurer_owner.id
  },

  # Crafters (8 grannies) - all owned by crafter_owner
  {
    name: "Yuki Tanaka", location: "Kyoto, Japan", price: 85, category: "crafters",
    bio: "Traditional tea ceremony master from Kyoto. I teach origami and love sharing Japanese culture with guests.",
    available: true, stats_speed: 4, stats_health: 8, stats_wisdom: 9, stats_teeth: 7,
    superhost: true, rating: 5, review_count: 0, age: 72, user_id: crafter_owner.id
  },
  {
    name: "Hanako Ishida", location: "Tokyo, Japan", price: 70, category: "crafters",
    bio: "Master craftsperson specializing in traditional Japanese arts. I teach pottery and calligraphy.",
    available: true, stats_speed: 3, stats_health: 7, stats_wisdom: 9, stats_teeth: 5,
    superhost: false, rating: 4, review_count: 0, age: 78, user_id: crafter_owner.id
  },
  {
    name: "Toshiko Saito", location: "Osaka, Japan", price: 80, category: "crafters",
    bio: "Master ceramicist and watercolor artist with 45 years experience creating beautiful pieces.",
    available: true, stats_speed: 2, stats_health: 6, stats_wisdom: 10, stats_teeth: 4,
    superhost: true, rating: 5, review_count: 0, age: 76, user_id: crafter_owner.id
  },
  {
    name: "Patricia Williams", location: "Vermont, USA", price: 105, category: "crafters",
    bio: "Master quilter whose work has been exhibited in galleries. Teaches traditional American quilting.",
    available: true, stats_speed: 2, stats_health: 6, stats_wisdom: 9, stats_teeth: 4,
    superhost: true, rating: 4, review_count: 0, age: 77, user_id: crafter_owner.id
  },
  {
    name: "Beatrice Martinez", location: "Tuscany, Italy", price: 92, category: "crafters",
    bio: "Traditional Italian ceramicist whose family has made pottery for 300 years.",
    available: true, stats_speed: 3, stats_health: 7, stats_wisdom: 8, stats_teeth: 5,
    superhost: false, rating: 5, review_count: 0, age: 78, user_id: crafter_owner.id
  },
  {
    name: "Astrid Johansson", location: "Gothenburg, Sweden", price: 98, category: "crafters",
    bio: "Traditional Scandinavian woodcarver and textile artist. Teaches Nordic folk crafts.",
    available: true, stats_speed: 4, stats_health: 7, stats_wisdom: 9, stats_teeth: 6,
    superhost: true, rating: 4, review_count: 0, age: 73, user_id: crafter_owner.id
  },
  {
    name: "Aisha Osman", location: "Fez, Morocco", price: 75, category: "crafters",
    bio: "Master weaver who creates traditional Moroccan carpets using techniques passed down for generations.",
    available: true, stats_speed: 3, stats_health: 6, stats_wisdom: 10, stats_teeth: 5,
    superhost: false, rating: 5, review_count: 0, age: 71, user_id: crafter_owner.id
  },
  {
    name: "Rosa Delgado", location: "Oaxaca, Mexico", price: 78, category: "crafters",
    bio: "Traditional Mexican artisan specializing in Talavera pottery and embroidered textiles.",
    available: true, stats_speed: 4, stats_health: 8, stats_wisdom: 8, stats_teeth: 6,
    superhost: true, rating: 4, review_count: 0, age: 69, user_id: crafter_owner.id
  },

  # Book Lovers (8 grannies) - all owned by booklover_owner
  {
    name: "Miyuki Nishida", location: "Tokyo, Japan", price: 65, category: "book-lovers",
    bio: "Retired librarian with extensive knowledge of Japanese and world literature. I host book clubs.",
    available: true, stats_speed: 3, stats_health: 6, stats_wisdom: 10, stats_teeth: 6,
    superhost: true, rating: 5, review_count: 0, age: 76, user_id: booklover_owner.id
  },
  {
    name: "Margaret Chen", location: "Oxford, England", price: 95, category: "book-lovers",
    bio: "Former literature professor at Oxford University with expertise in Victorian literature.",
    available: true, stats_speed: 5, stats_health: 9, stats_wisdom: 10, stats_teeth: 8,
    superhost: true, rating: 4, review_count: 0, age: 68, user_id: booklover_owner.id
  },
  {
    name: "Eleanor Fitzgerald", location: "Dublin, Ireland", price: 88, category: "book-lovers",
    bio: "Professor Emeritus of English Literature with a personal library of 5,000+ books.",
    available: true, stats_speed: 3, stats_health: 6, stats_wisdom: 10, stats_teeth: 6,
    superhost: true, rating: 5, review_count: 0, age: 76, user_id: booklover_owner.id
  },
  {
    name: "Françoise Moreau", location: "Paris, France", price: 110, category: "book-lovers",
    bio: "Former librarian at the Sorbonne specializing in French literature and philosophy.",
    available: true, stats_speed: 4, stats_health: 7, stats_wisdom: 10, stats_teeth: 7,
    superhost: false, rating: 4, review_count: 0, age: 72, user_id: booklover_owner.id
  },
  {
    name: "Sophia Papadopoulos", location: "Athens, Greece", price: 85, category: "book-lovers",
    bio: "Classical literature scholar who can recite Homer from memory and teaches ancient Greek.",
    available: true, stats_speed: 3, stats_health: 6, stats_wisdom: 10, stats_teeth: 6,
    superhost: true, rating: 5, review_count: 0, age: 74, user_id: booklover_owner.id
  },
  {
    name: "Rebecca Goldman", location: "New York, USA", price: 125, category: "book-lovers",
    bio: "Retired English teacher and published poet who mentored students for 40 years.",
    available: false, stats_speed: 4, stats_health: 7, stats_wisdom: 9, stats_teeth: 7,
    superhost: true, rating: 4, review_count: 0, age: 69, user_id: booklover_owner.id
  },
  {
    name: "Amina Hassan", location: "Istanbul, Turkey", price: 78, category: "book-lovers",
    bio: "Translator who speaks 7 languages and has translated over 100 literary works.",
    available: true, stats_speed: 5, stats_health: 8, stats_wisdom: 10, stats_teeth: 7,
    superhost: false, rating: 5, review_count: 0, age: 71, user_id: booklover_owner.id
  },
  {
    name: "Ludmila Volkov", location: "Moscow, Russia", price: 82, category: "book-lovers",
    bio: "Former university librarian specializing in Russian literature and rare manuscripts.",
    available: true, stats_speed: 3, stats_health: 6, stats_wisdom: 10, stats_teeth: 5,
    superhost: true, rating: 4, review_count: 0, age: 75, user_id: booklover_owner.id
  }
]

puts "Creating 48 grannies..."

# Create grannies and upload images to Cloudinary
grannies_data.each_with_index do |granny_attrs, index|
  # Upload image to Cloudinary FIRST
  file_path = Rails.root.join('app', 'assets', 'images', 'grannies', "Granny-#{index + 1}.svg")
  image_key = nil

  if File.exist?(file_path)
    begin
      puts "Uploading #{granny_attrs[:name]} to Cloudinary..."

      # Upload to Cloudinary
      upload_result = Cloudinary::Uploader.upload(
        file_path.to_s,
        folder: "development",
        resource_type: "auto",
        public_id: "granny_#{index + 1}"
      )

      image_key = upload_result['public_id']
      puts "✅ Successfully uploaded to Cloudinary: #{image_key}"

    rescue => e
      puts "❌ Failed to upload #{granny_attrs[:name]}: #{e.message}"
    end
  else
    puts "❌ Photo not found for #{granny_attrs[:name]}: #{file_path}"
  end

  # Now create the granny WITH the image_key
  if image_key
    granny = Granny.create!(granny_attrs.merge(image_key: image_key))
    puts "✅ Created #{granny.name} with image"
    puts "   Image URL: #{granny.image_url}"
  else
    # If no image was uploaded successfully, skip this granny or handle differently
    puts "⚠️  Skipping #{granny_attrs[:name]} - no image could be uploaded"
    # Uncomment the next line if you want to create grannies without images
    # granny = Granny.create!(granny_attrs.except(:image_key))
  end

  # Small delay to avoid overwhelming Cloudinary
  sleep(0.2)
end

puts "\n✅ Finished creating grannies with Cloudinary images!"
puts "\nSummary:"
Granny.group(:category).count.each do |category, count|
  puts "#{category}: #{count} grannies"
end

puts "\nImage status:"
grannies_with_images = Granny.where.not(image_key: nil).count
puts "Grannies with images: #{grannies_with_images}/#{Granny.count}"
