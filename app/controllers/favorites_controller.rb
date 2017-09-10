class FavoritesController < ApplicationController

  def create
    @gif = Gif.find(params[:gif_id])
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    if @favorite.save
      redirect_to favorites_path
    else
      redirect_to gif_path(@gif)
    end
  end

  def index
    @favorites = Favorite.all
  end

  private
  def favorite_params
    params.permit(:user_id, :gif_id)
  end
end
