require "application_system_test_case"

class PersonalFilesTest < ApplicationSystemTestCase
  setup do
    @personal_file = personal_files(:one)
  end

  test "visiting the index" do
    visit personal_files_url
    assert_selector "h1", text: "Personal Files"
  end

  test "creating a Personal file" do
    visit personal_files_url
    click_on "New Personal File"

    fill_in "Description", with: @personal_file.description
    fill_in "Name", with: @personal_file.name
    click_on "Create Personal file"

    assert_text "Personal file was successfully created"
    click_on "Back"
  end

  test "updating a Personal file" do
    visit personal_files_url
    click_on "Edit", match: :first

    fill_in "Description", with: @personal_file.description
    fill_in "Name", with: @personal_file.name
    click_on "Update Personal file"

    assert_text "Personal file was successfully updated"
    click_on "Back"
  end

  test "destroying a Personal file" do
    visit personal_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personal file was successfully destroyed"
  end
end
