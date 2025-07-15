require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get bookings" do
    get dashboard_bookings_url
    assert_response :success
  end

  test "should get listings" do
    get dashboard_listings_url
    assert_response :success
  end
end
