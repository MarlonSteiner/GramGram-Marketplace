class Granny < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # validates :name, :bio, :location, :price, presence: true
  # validates :price, numericality: { greater_than: 0 }

  has_one_attached :photo

  # def owner_name
  #   user.first_name + " " + user.last_name
  # end

    def owner_name
    user.full_name
  end

  def average_rating
    return "No reviews yet" if reviews.empty?
    reviews.average(:rating).round(1)
  end
end

class Granny < ApplicationRecord
  # Associations
  belongs_to :user      # Owner of the granny
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Cloudinary (Active Storage)
  has_one_attached :photo

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
