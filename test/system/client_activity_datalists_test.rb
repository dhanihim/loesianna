require "application_system_test_case"

class ClientActivityDatalistsTest < ApplicationSystemTestCase
  setup do
    @client_activity_datalist = client_activity_datalists(:one)
  end

  test "visiting the index" do
    visit client_activity_datalists_url
    assert_selector "h1", text: "Client Activity Datalists"
  end

  test "creating a Client activity datalist" do
    visit client_activity_datalists_url
    click_on "New Client Activity Datalist"

    fill_in "Description", with: @client_activity_datalist.description
    fill_in "Link", with: @client_activity_datalist.link
    click_on "Create Client activity datalist"

    assert_text "Client activity datalist was successfully created"
    click_on "Back"
  end

  test "updating a Client activity datalist" do
    visit client_activity_datalists_url
    click_on "Edit", match: :first

    fill_in "Description", with: @client_activity_datalist.description
    fill_in "Link", with: @client_activity_datalist.link
    click_on "Update Client activity datalist"

    assert_text "Client activity datalist was successfully updated"
    click_on "Back"
  end

  test "destroying a Client activity datalist" do
    visit client_activity_datalists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client activity datalist was successfully destroyed"
  end
end
