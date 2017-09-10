require 'rails_helper'

feature "new gif saved with duplicate category search" do
  scenario "user types category of already saved gif" do
    admin = User.create(username: "danny", password: "123", role: 1)
    category = Category.create(name: "happy")
    gif = Gif.create(image_path: "https://media0.giphy.com/media/PBM14uaJCbp72/200w.gif", category_id: category.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_gif_path
    fill_in "Search for:", with: "happy"
    click_on "Search"

    expect(current_path).to eq("/gifs/2")
    expect(page).to have_content("Here is your gif")
    expect(page).to_not have_css("img[src=\"#{gif.image_path}\"]")

    expect(Category.count).to eq(1)
    expect(Gif.count).to eq(2)
  end
end
