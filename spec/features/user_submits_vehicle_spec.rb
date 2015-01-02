require "rails_helper"

feature "User Submits a vehicle", %q(
As an authenticated user
I want to submit a vehicle
So that I can select see all the vehicles by manufacturer

Acceptance Criteria
[ ] Go to manufacturer/new to fill out form
[ ] User must enter manufacturer
[ ] User must enter model/name
[ ] User must enter year
[ ] User must enter color
[ ] User must enter mileage


) do

  context "authenticated user" do
    let(:user){ FactoryGirl.create(:user) }

    before(:each) do
      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "Log in"
    end

      scenario "user successfully submits a vehicle" do
        visit root_path
        click_link "Create New Manufacturer"
        fill_in "Name", with: "Maserati"
        fill_in "Country", with: "Italy"

        click_button "Submit Manufacturer"

        click_link "Add a Vehicle"
        fill_in "Color", with: "black"
        fill_in "Year", with: "2014"
        fill_in "Mileage", with: "12345"
        select("Maserati", from: 'Manufacturer')

        click_button "Submit Vehicle"
        expect(page).to have_content("You've successfully submitted a vehicle!")
        expect(page).to have_content("Maserati")
        expect(page).to have_content("black")
        expect(page).to have_content("2014")
        expect(page).to have_content("12345")
      end
    end
  end
