require 'test_helper'

class AccessControllerTest < ActionDispatch::IntegrationTest
  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  # test "should get menu" do
  #   get access_menu_url
  #   assert_response :success
  # end
  #
  test 'should get login' do
    get access_login_url
    assert_response :success
  end

end
