require 'test_helper'

class AdditionalViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get additional_views_contact_url
    assert_response :success
  end

end
