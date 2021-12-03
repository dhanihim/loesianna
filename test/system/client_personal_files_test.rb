require "application_system_test_case"

class ClientPersonalFilesTest < ApplicationSystemTestCase
  setup do
    @client_personal_file = client_personal_files(:one)
  end

  test "visiting the index" do
    visit client_personal_files_url
    assert_selector "h1", text: "Client Personal Files"
  end

  test "creating a Client personal file" do
    visit client_personal_files_url
    click_on "New Client Personal File"

    fill_in "Description", with: @client_personal_file.description
    fill_in "Link", with: @client_personal_file.link
    click_on "Create Client personal file"

    assert_text "Client personal file was successfully created"
    click_on "Back"
  end

  test "updating a Client personal file" do
    visit client_personal_files_url
    click_on "Edit", match: :first

    fill_in "Description", with: @client_personal_file.description
    fill_in "Link", with: @client_personal_file.link
    click_on "Update Client personal file"

    assert_text "Client personal file was successfully updated"
    click_on "Back"
  end

  test "destroying a Client personal file" do
    visit client_personal_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client personal file was successfully destroyed"
  end
end
