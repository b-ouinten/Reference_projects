require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get show_user" do
    get user_show_user_url
    assert_response :success
  end

end
