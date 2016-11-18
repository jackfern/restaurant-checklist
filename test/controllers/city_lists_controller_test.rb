require 'test_helper'

class CityListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_list = city_lists(:one)
  end

  test "should get index" do
    get city_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_city_list_url
    assert_response :success
  end

  test "should create city_list" do
    assert_difference('CityList.count') do
      post city_lists_url, params: { city_list: { city: @city_list.city } }
    end

    assert_redirected_to city_list_url(CityList.last)
  end

  test "should show city_list" do
    get city_list_url(@city_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_city_list_url(@city_list)
    assert_response :success
  end

  test "should update city_list" do
    patch city_list_url(@city_list), params: { city_list: { city: @city_list.city } }
    assert_redirected_to city_list_url(@city_list)
  end

  test "should destroy city_list" do
    assert_difference('CityList.count', -1) do
      delete city_list_url(@city_list)
    end

    assert_redirected_to city_lists_url
  end
end
