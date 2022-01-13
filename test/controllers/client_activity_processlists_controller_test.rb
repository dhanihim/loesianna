require "test_helper"

class ClientActivityProcesslistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_activity_processlist = client_activity_processlists(:one)
  end

  test "should get index" do
    get client_activity_processlists_url
    assert_response :success
  end

  test "should get new" do
    get new_client_activity_processlist_url
    assert_response :success
  end

  test "should create client_activity_processlist" do
    assert_difference('ClientActivityProcesslist.count') do
      post client_activity_processlists_url, params: { client_activity_processlist: { actual_start: @client_activity_processlist.actual_start, description: @client_activity_processlist.description, status: @client_activity_processlist.status, target_start: @client_activity_processlist.target_start } }
    end

    assert_redirected_to client_activity_processlist_url(ClientActivityProcesslist.last)
  end

  test "should show client_activity_processlist" do
    get client_activity_processlist_url(@client_activity_processlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_activity_processlist_url(@client_activity_processlist)
    assert_response :success
  end

  test "should update client_activity_processlist" do
    patch client_activity_processlist_url(@client_activity_processlist), params: { client_activity_processlist: { actual_start: @client_activity_processlist.actual_start, description: @client_activity_processlist.description, status: @client_activity_processlist.status, target_start: @client_activity_processlist.target_start } }
    assert_redirected_to client_activity_processlist_url(@client_activity_processlist)
  end

  test "should destroy client_activity_processlist" do
    assert_difference('ClientActivityProcesslist.count', -1) do
      delete client_activity_processlist_url(@client_activity_processlist)
    end

    assert_redirected_to client_activity_processlists_url
  end
end
