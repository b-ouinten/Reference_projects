require 'test_helper'

class ProvisionalCartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get provisional_cart_items_create_url
    assert_response :success
  end

end
