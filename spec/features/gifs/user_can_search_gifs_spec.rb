require 'rails_helper'

feature "admin can find gifs" do
  scenario "user types valid search in field" do
    admin = User.create(username: "danny", password: "123", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_gif_path
    fill_in "Search for:", with: "happy"
    click_on "Search"

    # save_and_open_page
    expect(current_path).to eq("/gifs/1")
    expect(page).to have_content("Here is your gif")
    expect(Category.count).to eq(1)
    expect(Gif.count).to eq(1)
  end
end

feature "user cannot find gifs" do
  scenario "does not allow default user to find gifs or create categories" do
    user = User.create(username: "jacque", password: "123", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_gif_path

    expect(page).to_not have_content("Here is your gif")
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

end
