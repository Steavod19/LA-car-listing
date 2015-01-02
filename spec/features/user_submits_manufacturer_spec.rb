require "rails_helper"

feature "User Submits a manufacturer", %q(
As an authenticated user
I want to submit a manufacturer
So that I can select this manufacturer when i input a vehicle

Acceptance Criteria
[ ] Go to manufaturer/new to fill out form
[ ] User must enter name
[ ] User must enter country

) do

  context "authenticated user" do
    let(:user){ FactoryGirl.create(:user) }

    before(:each) do
      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "Log in"
    end

    scenario "user successfully submits a manufacturer" do

      visit root_path
      click_link "Create New Manufacturer"
      fill_in "Name", with: "Maserati"
      fill_in "Country", with: "Italy"

      click_button "Submit Manufacturer"
      expect(page).to have_content("You've successfully submitted a manufacturer!")
      expect(page).to have_content("Maserati")
      expect(page).to have_content("Italy")

      click_link "CarListing"
      expect(page).to have_content("Maserati")
    end

    scenario "user unsuccessfully submits a manufacturer" do

      visit root_path
      click_link "Create New Manufacturer"
      fill_in "Name", with: ""
      fill_in "Country", with: "Germany"

      click_button "Submit Manufacturer"
      expect(page).to have_content("Fail")
    end
  end
end
