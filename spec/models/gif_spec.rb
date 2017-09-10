require 'rails_helper'

RSpec.describe Gif, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:image_path) }
    it { is_expected.to validate_uniqueness_of(:image_path) }
   end
end
