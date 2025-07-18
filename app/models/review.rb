class Review < ApplicationRecord
  belongs_to :user
  belongs_to :granny

  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :comment, presence: true

  # Auto-increment review_count when review is created
  after_create :increment_granny_review_count
  after_destroy :decrement_granny_review_count

  private

  def increment_granny_review_count
    granny.increment!(:review_count)
  end

  def decrement_granny_review_count
    granny.decrement!(:review_count)
  end
  
end
