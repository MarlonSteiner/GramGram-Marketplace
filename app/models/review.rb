class Review < ApplicationRecord
  belongs_to :user
  belongs_to :granny

  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :comment, presence: true
end
