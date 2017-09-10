class Gif < ApplicationRecord
  belongs_to :category
  has_many :favorites
  # validates :image_path, uniqueness: true
end
