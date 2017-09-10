require 'rails_helper'

describe "admin can delete category" do
  scenario "admin deletes category" do
    admin = User.create(username: "Admin", password: "123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category1 = Category.create(name: "colorado")
    category2 = Category.create(name: "happy")
    gif1 = Gif.create(image_path: "https://media3.giphy.com/media/xT9DPn3MABvIwlubgk/200w.gif", category_id: category1.id)
    gif2 = Gif.create(image_path: "https://media2.giphy.com/media/fGq2nGGSxMEkU/200w.gif", category_id: category1.id)
    gif3 = Gif.create(image_path: "https://media0.giphy.com/media/PBM14uaJCbp72/200w.gif", category_id: category2.id)
    gif4 = Gif.create(image_path: "https://media2.giphy.com/media/xThuW6sWCGbpZMpX7a/200w.gif", category_id: category2.id)

    visit '/admin/gifs'

    click_on "colorado"

    expect(current_path).to eq('/admin/categories/1')

    expect(page).to have_content("colorado")
    expect(page).to have_css("img[src=\"#{gif1.image_path}\"]")
    expect(page).to have_css("img[src=\"#{gif2.image_path}\"]")

    click_on "Delete Category?"

    expect(current_path).to eq('/admin/gifs')

    expect(Category.count).to eq(1)
    expect(page).to_not have_content("colorado")
    expect(page).to_not have_css("img[src=\"#{gif1.image_path}\"]")
    expect(page).to_not have_css("img[src=\"#{gif2.image_path}\"]")

    expect(page).to have_content("happy")
    expect(page).to have_css("img[src=\"#{gif3.image_path}\"]")
    expect(page).to have_css("img[src=\"#{gif4.image_path}\"]")

    click_on "happy"

    expect(current_path).to eq('/admin/categories/2')

    expect(page).to have_content("happy")
    expect(page).to have_css("img[src=\"#{gif3.image_path}\"]")
    expect(page).to have_css("img[src=\"#{gif4.image_path}\"]")

    click_on "Delete Category?"

    expect(current_path).to eq('/admin/gifs')

    expect(Category.count).to eq(0)
    expect(page).to_not have_content("happy")
    expect(page).to_not have_css("img[src=\"#{gif3.image_path}\"]")
    expect(page).to_not have_css("img[src=\"#{gif4.image_path}\"]")

    expect(page).to_not have_content("colorado")
    expect(page).to_not have_css("img[src=\"#{gif1.image_path}\"]")
    expect(page).to_not have_css("img[src=\"#{gif2.image_path}\"]")

  end
end
