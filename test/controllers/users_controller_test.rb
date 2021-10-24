require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get not_logged" do
    get users_not_logged_url
    assert_response :success
  end
end
