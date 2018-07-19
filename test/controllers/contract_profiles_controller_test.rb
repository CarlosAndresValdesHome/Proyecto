require 'test_helper'

class ContractProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract_profile = contract_profiles(:one)
  end

  test "should get index" do
    get contract_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_profile_url
    assert_response :success
  end

  test "should create contract_profile" do
    assert_difference('ContractProfile.count') do
      post contract_profiles_url, params: { contract_profile: { descripcion: @contract_profile.descripcion, id: @contract_profile.id, id_contratos: @contract_profile.id_contratos } }
    end

    assert_redirected_to contract_profile_url(ContractProfile.last)
  end

  test "should show contract_profile" do
    get contract_profile_url(@contract_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_profile_url(@contract_profile)
    assert_response :success
  end

  test "should update contract_profile" do
    patch contract_profile_url(@contract_profile), params: { contract_profile: { descripcion: @contract_profile.descripcion, id: @contract_profile.id, id_contratos: @contract_profile.id_contratos } }
    assert_redirected_to contract_profile_url(@contract_profile)
  end

  test "should destroy contract_profile" do
    assert_difference('ContractProfile.count', -1) do
      delete contract_profile_url(@contract_profile)
    end

    assert_redirected_to contract_profiles_url
  end
end
