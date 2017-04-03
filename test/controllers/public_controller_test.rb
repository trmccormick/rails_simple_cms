require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end
  
  test "should get index" do
    get public_index_url
    assert_response :success
  end
  #
  # test "should get show" do
  #   get public_show_url
  #   assert_response :success
  # end

end
