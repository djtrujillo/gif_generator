class RemoveNameFromGifs < ActiveRecord::Migration[5.1]
  def change
    remove_column :gifs, :name, :string
  end
end
