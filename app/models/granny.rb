class Granny < ApplicationRecord
  # Associations - KEEP ALL OF THIS
  belongs_to :user # Owner of the granny
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Added Geocoding - KEEP ALL OF THIS
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # Validations - KEEP ALL OF THIS
  validates :name, :bio, :location, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :image_key, presence: true

  # ADD THIS METHOD for Cloudinary URL generation
  def image_url
    return nil unless image_key.present?

    "https://res.cloudinary.com/dvepl31wb/image/upload/v1/#{image_key}"
  end

  # Instance Methods - KEEP ALL OF THIS
  def owner_name
    user.full_name
  end

  def average_rating
    return "No reviews yet" if reviews.empty?
    reviews.average(:rating).round(1)
  end
end
