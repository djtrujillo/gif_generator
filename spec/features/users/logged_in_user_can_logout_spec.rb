require 'rails_helper'

feature "logged in user can logout" do
  scenario "user logs in and clicks logout" do

    user = User.create(username: "danny", password: "123", password_confirmation: "123")
    visit '/'
    click_on "Already a user? Click Here"
    fill_in "session[username]", with: "danny"
    fill_in "session[password]", with: "123"
    click_on "Log In"

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(@current_user).to be_falsey
  end
end
