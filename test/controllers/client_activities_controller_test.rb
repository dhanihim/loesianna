require "test_helper"

class ClientActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_activity = client_activities(:one)
  end

  test "should get index" do
    get client_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_client_activity_url
    assert_response :success
  end

  test "should create client_activity" do
    assert_difference('ClientActivity.count') do
      post client_activities_url, params: { client_activity: { activity_expired: @client_activity.activity_expired, assistant: @client_activity.assistant, associate: @client_activity.associate, certificate_expired: @client_activity.certificate_expired, deleted: @client_activity.deleted, description: @client_activity.description, object: @client_activity.object, offline_location: @client_activity.offline_location, serial_number: @client_activity.serial_number, status: @client_activity.status } }
    end

    assert_redirected_to client_activity_url(ClientActivity.last)
  end

  test "should show client_activity" do
    get client_activity_url(@client_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_activity_url(@client_activity)
    assert_response :success
  end

  test "should update client_activity" do
    patch client_activity_url(@client_activity), params: { client_activity: { activity_expired: @client_activity.activity_expired, assistant: @client_activity.assistant, associate: @client_activity.associate, certificate_expired: @client_activity.certificate_expired, deleted: @client_activity.deleted, description: @client_activity.description, object: @client_activity.object, offline_location: @client_activity.offline_location, serial_number: @client_activity.serial_number, status: @client_activity.status } }
    assert_redirected_to client_activity_url(@client_activity)
  end

  test "should destroy client_activity" do
    assert_difference('ClientActivity.count', -1) do
      delete client_activity_url(@client_activity)
    end

    assert_redirected_to client_activities_url
  end
end
