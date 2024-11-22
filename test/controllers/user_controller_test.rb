require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get created_events" do
    get user_created_events_url
    assert_response :success
  end
end
