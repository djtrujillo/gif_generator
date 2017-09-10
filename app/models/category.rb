class Category < ApplicationRecord
  has_many :gifs, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
