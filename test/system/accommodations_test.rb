require "application_system_test_case"

class AccommodationsTest < ApplicationSystemTestCase
  setup do
    @accommodation = accommodations(:one)
  end

  test "visiting the index" do
    visit accommodations_url
    assert_selector "h1", text: "Accommodations"
  end

  test "should create accommodation" do
    visit accommodations_url
    click_on "New accommodation"

    fill_in "Address", with: @accommodation.address
    fill_in "Name", with: @accommodation.name
    fill_in "Rating", with: @accommodation.rating
    click_on "Create Accommodation"

    assert_text "Accommodation was successfully created"
    click_on "Back"
  end

  test "should update Accommodation" do
    visit accommodation_url(@accommodation)
    click_on "Edit this accommodation", match: :first

    fill_in "Address", with: @accommodation.address
    fill_in "Name", with: @accommodation.name
    fill_in "Rating", with: @accommodation.rating
    click_on "Update Accommodation"

    assert_text "Accommodation was successfully updated"
    click_on "Back"
  end

  test "should destroy Accommodation" do
    visit accommodation_url(@accommodation)
    click_on "Destroy this accommodation", match: :first

    assert_text "Accommodation was successfully destroyed"
  end
end
