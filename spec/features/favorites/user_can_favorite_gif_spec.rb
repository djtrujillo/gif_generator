require 'rails_helper'

feature "User can favorite gif" do
  scenario "they add to favorites from the show page" do
    user = User.create(username: "Jacque", password: "123", role: 0)
    category = Category.create(name: "colorado")
    gif = Gif.create(image_path: "https://media3.giphy.com/media/xT9DPn3MABvIwlubgk/200w.gif", category_id: category.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gif_path(gif)

    click_on "Add to favorites?"

    expect(current_path).to eq("/users/#{user.id}/favorites")
    expect(page).to have_content("Favorite Gifs")
    expect(page).to have_css("img[src=\"#{gif.image_path}\"]")
  end

  # scenario "user can view all gifs they've favorited sorted by category" do
  #   user = User.create(username: "Jacque", password: "123", role: 0)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #   category1 = Category.create(name: "colorado")
  #   category2 = Category.create(name: "happy")
  #   gif1 = Gif.create(image_path: "https://media3.giphy.com/media/xT9DPn3MABvIwlubgk/200w.gif", category_id: category1.id)
  #   gif2 = Gif.create(image_path: "https://media2.giphy.com/media/fGq2nGGSxMEkU/200w.gif", category_id: category1.id)
  #   gif3 = Gif.create(image_path: "https://media0.giphy.com/media/PBM14uaJCbp72/200w.gif", category_id: category2.id)
  #   gif4 = Gif.create(image_path: "https://media2.giphy.com/media/xThuW6sWCGbpZMpX7a/200w.gif", category_id: category2.id)
  #   favorite1 = Favorite.create(gif_id: gif1.id, user_id: user.id)
  #   favorite2 = Favorite.create(gif_id: gif2.id, user_id: user.id)
  #   favorite3 = Favorite.create(gif_id: gif3.id, user_id: user.id)
  #   favorite4 = Favorite.create(gif_id: gif4.id, user_id: user.id)
  #
  #   visit '/favorites'
  #   expect(page).to have_content("colorado")
  #   expect(page).to have_css("img[src=\"#{gif1.image_path}\"]")
  #   expect(page).to have_css("img[src=\"#{gif2.image_path}\"]")
  #
  #   expect(page).to have_content("happy")
  #   expect(page).to have_css("img[src=\"#{gif3.image_path}\"]")
  #   expect(page).to have_css("img[src=\"#{gif4.image_path}\"]")
  #
  #
  # end


end
