class DashboardController < ApplicationController
  before_action :authenticate_user!

  def listings
    # Your existing listings method - keep whatever you have here
    @grannies = current_user.grannies if current_user.respond_to?(:grannies)
  end

  def bookings
    # Get user's reservations with associated granny data
    @reservations = current_user.reservations.includes(:granny)

    # Convert to format expected by React component
    @reservations_json = @reservations.map do |reservation|
      granny = reservation.granny

      {
        id: reservation.id,
        hostName: granny.name,
        hostImage: granny.image,
        address: granny.location,
        coordinates: {
          lat: granny.latitude.to_f,
          lng: granny.longitude.to_f
        },
        dates: format_date_range(reservation.start_date, reservation.end_date),
        duration: calculate_duration(reservation.start_date, reservation.end_date),
        guests: 1,
        totalPrice: calculate_price(reservation),
        status: reservation.status.capitalize,
        checkIn: "3:00 PM",
        checkOut: "11:00 AM",
        hostPhone: "Contact via platform",
        hostEmail: "Contact via platform",
        rating: granny.rating || 5.0,
        reviewCount: granny.review_count || 0,
        specialRequests: "None",
        houseImage: granny.image,
        amenities: get_granny_amenities(granny)
      }
    end
  end

  private

  def format_date_range(start_date, end_date)
    "#{start_date.strftime('%B %d')} - #{end_date.strftime('%B %d, %Y')}"
  end

  def calculate_duration(start_date, end_date)
    nights = (end_date - start_date).to_i
    "#{nights} #{nights == 1 ? 'night' : 'nights'}"
  end

  def calculate_price(reservation)
    granny = reservation.granny
    nights = (reservation.end_date - reservation.start_date).to_i
    granny.price * nights
  end

  def get_granny_amenities(granny)
    amenities = ["Granny Care", "#{granny.category} Experience"]

    amenities << "High Energy" if granny.stats_speed > 75
    amenities << "Health Conscious" if granny.stats_health > 75
    amenities << "Great Wisdom" if granny.stats_wisdom > 75
    amenities << "Perfect Smile" if granny.stats_teeth > 75
    amenities << "Superhost" if granny.superhost

    amenities
  end
end
