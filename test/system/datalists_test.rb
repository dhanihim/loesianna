require "application_system_test_case"

class DatalistsTest < ApplicationSystemTestCase
  setup do
    @datalist = datalists(:one)
  end

  test "visiting the index" do
    visit datalists_url
    assert_selector "h1", text: "Datalists"
  end

  test "creating a Datalist" do
    visit datalists_url
    click_on "New Datalist"

    fill_in "Description", with: @datalist.description
    fill_in "Name", with: @datalist.name
    click_on "Create Datalist"

    assert_text "Datalist was successfully created"
    click_on "Back"
  end

  test "updating a Datalist" do
    visit datalists_url
    click_on "Edit", match: :first

    fill_in "Description", with: @datalist.description
    fill_in "Name", with: @datalist.name
    click_on "Update Datalist"

    assert_text "Datalist was successfully updated"
    click_on "Back"
  end

  test "destroying a Datalist" do
    visit datalists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Datalist was successfully destroyed"
  end
end
