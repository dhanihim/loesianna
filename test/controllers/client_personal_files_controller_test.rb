require "test_helper"

class ClientPersonalFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_personal_file = client_personal_files(:one)
  end

  test "should get index" do
    get client_personal_files_url
    assert_response :success
  end

  test "should get new" do
    get new_client_personal_file_url
    assert_response :success
  end

  test "should create client_personal_file" do
    assert_difference('ClientPersonalFile.count') do
      post client_personal_files_url, params: { client_personal_file: { description: @client_personal_file.description, link: @client_personal_file.link } }
    end

    assert_redirected_to client_personal_file_url(ClientPersonalFile.last)
  end

  test "should show client_personal_file" do
    get client_personal_file_url(@client_personal_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_personal_file_url(@client_personal_file)
    assert_response :success
  end

  test "should update client_personal_file" do
    patch client_personal_file_url(@client_personal_file), params: { client_personal_file: { description: @client_personal_file.description, link: @client_personal_file.link } }
    assert_redirected_to client_personal_file_url(@client_personal_file)
  end

  test "should destroy client_personal_file" do
    assert_difference('ClientPersonalFile.count', -1) do
      delete client_personal_file_url(@client_personal_file)
    end

    assert_redirected_to client_personal_files_url
  end
end
