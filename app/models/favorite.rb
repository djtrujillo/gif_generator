class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gif

  validates :user_id, presence: true
  validates :gif_id, presence: true

  def self.all_by_category
    joins(:gif).group_by {|t| t.gif.category.name}
  end


end
