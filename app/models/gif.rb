class Gif < ApplicationRecord
  belongs_to :category
  has_many :favorites
  validates :image_path, presence: true, uniqueness: true
end
