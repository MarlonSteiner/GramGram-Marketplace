class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :grannies, dependent: :destroy

  has_one_attached :avatar

  # validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def owner_of?(granny)
    granny.user == self
  end

  def renter_of?(reservation)
    reservation.user == self
  end
end

# <% if current_user.owner_of?(granny) %>
#   <h3>Reservation Requests:</h3>
#   <!-- Loop over reservations for this granny -->
# <% end %>

# <% if current_user.renter_of?(reservation) %>
#   <h3>Your Booking Details:</h3>
#   <!-- Renter-only stuff here -->
# <% end %>
