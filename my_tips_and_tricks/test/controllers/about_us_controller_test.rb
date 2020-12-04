require 'test_helper'

class AboutUsControllerTest < ActionDispatch::IntegrationTest
  test "should get contatc" do
    get about_us_contatc_url
    assert_response :success
  end

end
