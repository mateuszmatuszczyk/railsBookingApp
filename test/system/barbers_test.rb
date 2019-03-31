require "application_system_test_case"

class BarbersTest < ApplicationSystemTestCase
  setup do
    @barber = barbers(:one)
  end

  test "visiting the index" do
    visit barbers_url
    assert_selector "h1", text: "Barbers"
  end

  test "creating a Barber" do
    visit barbers_url
    click_on "New Barber"

    fill_in "Barber bio", with: @barber.barber_bio
    fill_in "Barber name", with: @barber.barber_name
    fill_in "Barber photo path", with: @barber.barber_photo_path
    fill_in "User", with: @barber.user_id
    click_on "Create Barber"

    assert_text "Barber was successfully created"
    click_on "Back"
  end

  test "updating a Barber" do
    visit barbers_url
    click_on "Edit", match: :first

    fill_in "Barber bio", with: @barber.barber_bio
    fill_in "Barber name", with: @barber.barber_name
    fill_in "Barber photo path", with: @barber.barber_photo_path
    fill_in "User", with: @barber.user_id
    click_on "Update Barber"

    assert_text "Barber was successfully updated"
    click_on "Back"
  end

  test "destroying a Barber" do
    visit barbers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barber was successfully destroyed"
  end
end
