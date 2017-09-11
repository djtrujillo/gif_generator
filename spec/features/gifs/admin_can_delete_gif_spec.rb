require 'rails_helper'

feature "admin can unfavorite gifs" do
  scenario "they visit gifs index and unfavorite" do
    admin = User.create(username: "Jacque", password: "123", role: 1)
    category1 = Category.create(name: "colorado")
    gif1 = Gif.create(image_path: "https://media3.giphy.com/media/xT9DPn3MABvIwlubgk/200w.gif", category_id: category1.id)
    gif2 = Gif.create(image_path: "https://media2.giphy.com/media/fGq2nGGSxMEkU/200w.gif", category_id: category1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    visit "/admin/gifs/#{gif1.id}"

    expect(page).to have_css("img[src=\"#{gif1.image_path}\"]")
    expect(Gif.all.count).to eq(2)

    click_on "Delete Gif?"

    expect(current_path).to eq("/admin/gifs")
    expect(Gif.all.count).to eq(1)
    expect(page).to_not have_css("img[src=\"#{gif1.image_path}\"]")
    expect(page).to have_css("img[src=\"#{gif2.image_path}\"]")
  end
end
