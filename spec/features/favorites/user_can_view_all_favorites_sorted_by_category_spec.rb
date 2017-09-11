require 'rails_helper'

describe "user can view all favorites sorted by category" do
  scenario "user visits index and sees categories with gifs" do
      user = User.create(username: "Jacque", password: "123", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      category1 = Category.create(name: "colorado")
      category2 = Category.create(name: "happy")
      gif1 = Gif.create(image_path: "https://media3.giphy.com/media/xT9DPn3MABvIwlubgk/200w.gif", category_id: category1.id)
      gif2 = Gif.create(image_path: "https://media2.giphy.com/media/fGq2nGGSxMEkU/200w.gif", category_id: category1.id)
      gif3 = Gif.create(image_path: "https://media0.giphy.com/media/PBM14uaJCbp72/200w.gif", category_id: category2.id)
      gif4 = Gif.create(image_path: "https://media2.giphy.com/media/xThuW6sWCGbpZMpX7a/200w.gif", category_id: category2.id)
      favorite1 = Favorite.create(gif_id: gif1.id, user_id: user.id)
      favorite2 = Favorite.create(gif_id: gif2.id, user_id: user.id)
      favorite3 = Favorite.create(gif_id: gif3.id, user_id: user.id)
      favorite4 = Favorite.create(gif_id: gif4.id, user_id: user.id)

      visit "/users/#{user.id}/favorites"

      expect(page).to have_content("colorado")
      expect(page).to have_css("img[src=\"#{gif1.image_path}\"]")
      expect(page).to have_css("img[src=\"#{gif2.image_path}\"]")

      expect(page).to have_content("happy")
      expect(page).to have_css("img[src=\"#{gif3.image_path}\"]")
      expect(page).to have_css("img[src=\"#{gif4.image_path}\"]")
    end
  end
