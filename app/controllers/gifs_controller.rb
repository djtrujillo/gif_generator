class GifsController < ApplicationController
  def index
    @gifs = Gif.all_by_category
  end

  def show
    @gif = Gif.find(params[:id])
  end
end
