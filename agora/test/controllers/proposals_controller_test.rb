require 'test_helper'

class ProposalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get proposals_index_url
    assert_response :success
  end

end
