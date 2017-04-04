require 'test_helper'

class AdminUsersControllerTest < ActionDispatch::IntegrationTest
  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  # test "should get index" do
  #   get admin_users_index_url
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get admin_users_new_url
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get admin_users_edit_url
  #   assert_response :success
  # end
  #
  # test "should get delete" do
  #   get admin_users_delete_url
  #   assert_response :success
  # end

  test "should get login" do
    get access_login_url
    assert_response :success
  end

  test "should get logout" do
    get access_logout_url
    assert_response :success
  end

end
