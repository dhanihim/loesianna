require "test_helper"

class DatalistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @datalist = datalists(:one)
  end

  test "should get index" do
    get datalists_url
    assert_response :success
  end

  test "should get new" do
    get new_datalist_url
    assert_response :success
  end

  test "should create datalist" do
    assert_difference('Datalist.count') do
      post datalists_url, params: { datalist: { description: @datalist.description, name: @datalist.name } }
    end

    assert_redirected_to datalist_url(Datalist.last)
  end

  test "should show datalist" do
    get datalist_url(@datalist)
    assert_response :success
  end

  test "should get edit" do
    get edit_datalist_url(@datalist)
    assert_response :success
  end

  test "should update datalist" do
    patch datalist_url(@datalist), params: { datalist: { description: @datalist.description, name: @datalist.name } }
    assert_redirected_to datalist_url(@datalist)
  end

  test "should destroy datalist" do
    assert_difference('Datalist.count', -1) do
      delete datalist_url(@datalist)
    end

    assert_redirected_to datalists_url
  end
end
