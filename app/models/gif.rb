class Gif < ApplicationRecord
  belongs_to :category
  has_many :favorites
  validates :image_path, presence: true, uniqueness: true

  def self.all_by_category

    joins(:category).group_by {|t| t.category}
  end

end
