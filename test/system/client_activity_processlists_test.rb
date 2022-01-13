require "application_system_test_case"

class ClientActivityProcesslistsTest < ApplicationSystemTestCase
  setup do
    @client_activity_processlist = client_activity_processlists(:one)
  end

  test "visiting the index" do
    visit client_activity_processlists_url
    assert_selector "h1", text: "Client Activity Processlists"
  end

  test "creating a Client activity processlist" do
    visit client_activity_processlists_url
    click_on "New Client Activity Processlist"

    fill_in "Actual start", with: @client_activity_processlist.actual_start
    fill_in "Description", with: @client_activity_processlist.description
    fill_in "Status", with: @client_activity_processlist.status
    fill_in "Target start", with: @client_activity_processlist.target_start
    click_on "Create Client activity processlist"

    assert_text "Client activity processlist was successfully created"
    click_on "Back"
  end

  test "updating a Client activity processlist" do
    visit client_activity_processlists_url
    click_on "Edit", match: :first

    fill_in "Actual start", with: @client_activity_processlist.actual_start
    fill_in "Description", with: @client_activity_processlist.description
    fill_in "Status", with: @client_activity_processlist.status
    fill_in "Target start", with: @client_activity_processlist.target_start
    click_on "Update Client activity processlist"

    assert_text "Client activity processlist was successfully updated"
    click_on "Back"
  end

  test "destroying a Client activity processlist" do
    visit client_activity_processlists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client activity processlist was successfully destroyed"
  end
end
