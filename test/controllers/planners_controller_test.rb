require "test_helper"

class PlannersControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get planners_dashboard_url
    assert_response :success
  end
end
