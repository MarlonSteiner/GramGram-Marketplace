class Granny < ApplicationRecord
  # Associations
  belongs_to :user# Owner of the granny
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Cloudinary (Active Storage)
  has_one_attached :photo

  # Added Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Validations
  validates :name, :bio, :location, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Instance Methods
  def owner_name
    user.full_name
  end

  def average_rating
    return "No reviews yet" if reviews.empty?
    reviews.average(:rating).round(1)
  end
end
