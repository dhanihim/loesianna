require "test_helper"

class ProcesslistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @processlist = processlists(:one)
  end

  test "should get index" do
    get processlists_url
    assert_response :success
  end

  test "should get new" do
    get new_processlist_url
    assert_response :success
  end

  test "should create processlist" do
    assert_difference('Processlist.count') do
      post processlists_url, params: { processlist: { description: @processlist.description, name: @processlist.name } }
    end

    assert_redirected_to processlist_url(Processlist.last)
  end

  test "should show processlist" do
    get processlist_url(@processlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_processlist_url(@processlist)
    assert_response :success
  end

  test "should update processlist" do
    patch processlist_url(@processlist), params: { processlist: { description: @processlist.description, name: @processlist.name } }
    assert_redirected_to processlist_url(@processlist)
  end

  test "should destroy processlist" do
    assert_difference('Processlist.count', -1) do
      delete processlist_url(@processlist)
    end

    assert_redirected_to processlists_url
  end
end
