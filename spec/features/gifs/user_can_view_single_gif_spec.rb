# A user can visit gif index
# they select a gif as favorite
# they click See Favorites
# they are shown the favorites index with all of their favorites

require 'rails_helper'

feature "User can view single gif" do
  scenario "user visits gif index" do
    user = User.create(username: "Jacque", password: "123", role: 0)
    category = Category.create(name: "colorado")
    gif = Gif.create(image_path: "https://media3.giphy.com/media/xT9DPn3MABvIwlubgk/200w.gif", category_id: category.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    click_on("View Gif")

    expect(current_path).to eq(gif_path(gif))
    expect(page).to have_content("Here is your gif of #{gif.category.name}")
  end
end
