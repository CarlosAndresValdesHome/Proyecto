require 'test_helper'

class ChargeProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @charge_profile = charge_profiles(:one)
  end

  test "should get index" do
    get charge_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_charge_profile_url
    assert_response :success
  end

  test "should create charge_profile" do
    assert_difference('ChargeProfile.count') do
      post charge_profiles_url, params: { charge_profile: { descripcion: @charge_profile.descripcion, id: @charge_profile.id } }
    end

    assert_redirected_to charge_profile_url(ChargeProfile.last)
  end

  test "should show charge_profile" do
    get charge_profile_url(@charge_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_charge_profile_url(@charge_profile)
    assert_response :success
  end

  test "should update charge_profile" do
    patch charge_profile_url(@charge_profile), params: { charge_profile: { descripcion: @charge_profile.descripcion, id: @charge_profile.id } }
    assert_redirected_to charge_profile_url(@charge_profile)
  end

  test "should destroy charge_profile" do
    assert_difference('ChargeProfile.count', -1) do
      delete charge_profile_url(@charge_profile)
    end

    assert_redirected_to charge_profiles_url
  end
end
