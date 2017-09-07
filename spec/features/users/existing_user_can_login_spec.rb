require 'rails_helper'

feature "existing user is able to login" do
  scenario "user clicks already user fills in info and logs in" do
    user = User.create(username: "danny", password: "123", password_confirmation: "123")
    visit '/'

    expect(page).to have_link("Already a user? Click Here")

    click_on "Already a user? Click Here"

    expect(current_path).to eq(login_path)

    fill_in "session[username]", with: "danny"
    fill_in "session[password]", with: "123"
    # fill_in "user[password_confirmation]", with: "123"

    click_on "Log In"

    expect(page).to have_content("Welcome to GifGenerator, #{user.username}")
  end
end
