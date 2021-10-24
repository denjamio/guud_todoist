require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get unauthorized" do
    get errors_unauthorized_url
    assert_response :success
  end
end
