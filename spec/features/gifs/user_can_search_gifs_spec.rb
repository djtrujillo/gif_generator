require 'rails_helper'

feature "user can search gifs" do
  scenario "user types valid search in field" do
    visit new_gif_path
    fill_in "Search for:", with: "colorado"
    click_on "Search"

    # save_and_open_page
    expect(current_path).to eq("/gifs/1")
    expect(page).to have_content("Here is your gif")
    expect(Gif.count).to eq(1)
  end
end
