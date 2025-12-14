require "test_helper"

class RespondentsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get respondents_dashboard_url
    assert_response :success
  end
end
