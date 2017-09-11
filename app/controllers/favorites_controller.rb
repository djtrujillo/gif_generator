class FavoritesController < ApplicationController

  def create
    @gif = Gif.find(params[:gif_id])
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id

    if @favorite.save
      redirect_to user_favorites_path(current_user)
    else
      redirect_to gif_path(@gif)
    end
  end

  def index
    # binding.pry
    @favorites = Favorite.where(user_id: current_user.id).group_by {|t| t.gif.category.name}

  end

  def destroy

    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to user_favorites_path(@favorite.user)
  end

  private
  def favorite_params
    params.permit(:user_id, :gif_id)
  end
end
