class Category < ApplicationRecord
  has_many :gifs, dependent: :destroy
  has_many :favorites, through: :gifs, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
