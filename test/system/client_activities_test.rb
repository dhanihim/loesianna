require "application_system_test_case"

class ClientActivitiesTest < ApplicationSystemTestCase
  setup do
    @client_activity = client_activities(:one)
  end

  test "visiting the index" do
    visit client_activities_url
    assert_selector "h1", text: "Client Activities"
  end

  test "creating a Client activity" do
    visit client_activities_url
    click_on "New Client Activity"

    fill_in "Activity expired", with: @client_activity.activity_expired
    fill_in "Assistant", with: @client_activity.assistant
    fill_in "Associate", with: @client_activity.associate
    fill_in "Certificate expired", with: @client_activity.certificate_expired
    fill_in "Deleted", with: @client_activity.deleted
    fill_in "Description", with: @client_activity.description
    fill_in "Object", with: @client_activity.object
    fill_in "Offline location", with: @client_activity.offline_location
    fill_in "Serial number", with: @client_activity.serial_number
    fill_in "Status", with: @client_activity.status
    click_on "Create Client activity"

    assert_text "Client activity was successfully created"
    click_on "Back"
  end

  test "updating a Client activity" do
    visit client_activities_url
    click_on "Edit", match: :first

    fill_in "Activity expired", with: @client_activity.activity_expired
    fill_in "Assistant", with: @client_activity.assistant
    fill_in "Associate", with: @client_activity.associate
    fill_in "Certificate expired", with: @client_activity.certificate_expired
    fill_in "Deleted", with: @client_activity.deleted
    fill_in "Description", with: @client_activity.description
    fill_in "Object", with: @client_activity.object
    fill_in "Offline location", with: @client_activity.offline_location
    fill_in "Serial number", with: @client_activity.serial_number
    fill_in "Status", with: @client_activity.status
    click_on "Update Client activity"

    assert_text "Client activity was successfully updated"
    click_on "Back"
  end

  test "destroying a Client activity" do
    visit client_activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client activity was successfully destroyed"
  end
end
