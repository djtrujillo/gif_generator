require 'rails_helper'

RSpec.describe Favorite, type: :model do

  context "validations" do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:gif_id) }
   end

  context "class methods" do
    it "sorts all by category" do
      user = User.create(username: "Jacque", password: "123", role: 0)
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


      expect(Favorite.all_by_category).to eq({"colorado" => [favorite1, favorite2], "happy" => [favorite3, favorite4]})
    end
  end
end
