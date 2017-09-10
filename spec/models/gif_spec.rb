require 'rails_helper'

RSpec.describe Gif, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:image_path) }
    it { is_expected.to validate_uniqueness_of(:image_path) }
   end

  context "class methods" do
    it "sorts all by category" do
      category1 = Category.create(name: "colorado")
      category2 = Category.create(name: "happy")
      gif1 = Gif.create(image_path: "https://media3.giphy.com/media/xT9DPn3MABvIwlubgk/200w.gif", category_id: category1.id)
      gif2 = Gif.create(image_path: "https://media2.giphy.com/media/fGq2nGGSxMEkU/200w.gif", category_id: category1.id)
      gif3 = Gif.create(image_path: "https://media0.giphy.com/media/PBM14uaJCbp72/200w.gif", category_id: category2.id)
      gif4 = Gif.create(image_path: "https://media2.giphy.com/media/xThuW6sWCGbpZMpX7a/200w.gif", category_id: category2.id)

      expect(Gif.all_by_category).to eq({category1 => [gif1, gif2], category2 => [gif3, gif4]})
    end
  end
end
