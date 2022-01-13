require "test_helper"

class ClientActivityDatalistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_activity_datalist = client_activity_datalists(:one)
  end

  test "should get index" do
    get client_activity_datalists_url
    assert_response :success
  end

  test "should get new" do
    get new_client_activity_datalist_url
    assert_response :success
  end

  test "should create client_activity_datalist" do
    assert_difference('ClientActivityDatalist.count') do
      post client_activity_datalists_url, params: { client_activity_datalist: { description: @client_activity_datalist.description, link: @client_activity_datalist.link } }
    end

    assert_redirected_to client_activity_datalist_url(ClientActivityDatalist.last)
  end

  test "should show client_activity_datalist" do
    get client_activity_datalist_url(@client_activity_datalist)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_activity_datalist_url(@client_activity_datalist)
    assert_response :success
  end

  test "should update client_activity_datalist" do
    patch client_activity_datalist_url(@client_activity_datalist), params: { client_activity_datalist: { description: @client_activity_datalist.description, link: @client_activity_datalist.link } }
    assert_redirected_to client_activity_datalist_url(@client_activity_datalist)
  end

  test "should destroy client_activity_datalist" do
    assert_difference('ClientActivityDatalist.count', -1) do
      delete client_activity_datalist_url(@client_activity_datalist)
    end

    assert_redirected_to client_activity_datalists_url
  end
end
