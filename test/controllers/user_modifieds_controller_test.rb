require 'test_helper'

class UserModifiedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_modified = user_modifieds(:one)
  end

  test "should get index" do
    get user_modifieds_url
    assert_response :success
  end

  test "should get new" do
    get new_user_modified_url
    assert_response :success
  end

  test "should create user_modified" do
    assert_difference('UserModified.count') do
      post user_modifieds_url, params: { user_modified: { name: @user_modified.name } }
    end

    assert_redirected_to user_modified_url(UserModified.last)
  end

  test "should show user_modified" do
    get user_modified_url(@user_modified)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_modified_url(@user_modified)
    assert_response :success
  end

  test "should update user_modified" do
    patch user_modified_url(@user_modified), params: { user_modified: { name: @user_modified.name } }
    assert_redirected_to user_modified_url(@user_modified)
  end

  test "should destroy user_modified" do
    assert_difference('UserModified.count', -1) do
      delete user_modified_url(@user_modified)
    end

    assert_redirected_to user_modifieds_url
  end
end
