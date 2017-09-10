require 'rails_helper'

feature "user can unfavorite gifs" do
  scenario "they visit favorites index and unfavorite" do
    user = User.create(username: "Jacque", password: "123", role: 0)
    category1 = Category.create(name: "colorado")
    gif1 = Gif.create(image_path: "https://media3.giphy.com/media/xT9DPn3MABvIwlubgk/200w.gif", category_id: category1.id)
    gif2 = Gif.create(image_path: "https://media2.giphy.com/media/fGq2nGGSxMEkU/200w.gif", category_id: category1.id)
    favorite1 = Favorite.create(gif_id: gif1.id, user_id: user.id)
    favorite2 = Favorite.create(gif_id: gif2.id, user_id: user.id)

    visit '/favorites'

    expect(page).to have_css("img[src=\"#{gif1.image_path}\"]")
    expect(page).to have_css("img[src=\"#{gif2.image_path}\"]")
    expect(Favorite.all.count).to eq(2)

    click_on "Unfavorite Gif #1?"

    expect(current_path).to eq('/favorites')
    expect(Favorite.all.count).to eq(1)
    expect(page).to_not have_css("img[src=\"#{gif1.image_path}\"]")
    expect(page).to have_css("img[src=\"#{gif2.image_path}\"]")
  end
end
