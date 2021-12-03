require "test_helper"

class PersonalFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_file = personal_files(:one)
  end

  test "should get index" do
    get personal_files_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_file_url
    assert_response :success
  end

  test "should create personal_file" do
    assert_difference('PersonalFile.count') do
      post personal_files_url, params: { personal_file: { description: @personal_file.description, name: @personal_file.name } }
    end

    assert_redirected_to personal_file_url(PersonalFile.last)
  end

  test "should show personal_file" do
    get personal_file_url(@personal_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_file_url(@personal_file)
    assert_response :success
  end

  test "should update personal_file" do
    patch personal_file_url(@personal_file), params: { personal_file: { description: @personal_file.description, name: @personal_file.name } }
    assert_redirected_to personal_file_url(@personal_file)
  end

  test "should destroy personal_file" do
    assert_difference('PersonalFile.count', -1) do
      delete personal_file_url(@personal_file)
    end

    assert_redirected_to personal_files_url
  end
end
