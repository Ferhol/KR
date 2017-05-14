require 'test_helper'

class Driver1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver1 = driver1s(:one)
  end

  test "should get index" do
    get driver1s_url
    assert_response :success
  end

  test "should get new" do
    get new_driver1_url
    assert_response :success
  end

  test "should create driver1" do
    assert_difference('Driver1.count') do
      post driver1s_url, params: { driver1: { birthday: @driver1.birthday, fn: @driver1.fn, inn: @driver1.inn, ln: @driver1.ln, number_p: @driver1.number_p, series_p: @driver1.series_p, sn: @driver1.sn } }
    end

    assert_redirected_to driver1_url(Driver1.last)
  end

  test "should show driver1" do
    get driver1_url(@driver1)
    assert_response :success
  end

  test "should get edit" do
    get edit_driver1_url(@driver1)
    assert_response :success
  end

  test "should update driver1" do
    patch driver1_url(@driver1), params: { driver1: { birthday: @driver1.birthday, fn: @driver1.fn, inn: @driver1.inn, ln: @driver1.ln, number_p: @driver1.number_p, series_p: @driver1.series_p, sn: @driver1.sn } }
    assert_redirected_to driver1_url(@driver1)
  end

  test "should destroy driver1" do
    assert_difference('Driver1.count', -1) do
      delete driver1_url(@driver1)
    end

    assert_redirected_to driver1s_url
  end
end
