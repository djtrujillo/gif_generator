require 'rails_helper'

describe "guest becomes a user" do
  context "guest creates a new user" do
    it "sees and fills out new user form" do
      visit '/'

      click_on("Create New User")

      expect(current_path).to eq(new_user_path)

      fill_in "user[username]", with: "dt123"
      fill_in "user[password]", with: "1234"
      # fill_in "user[password_confirmation]", with: "1234"


      click_on "Create User"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome to GifGenerator, dt123")
      expect(page).to have_link("Logout")
    end
  end
end
