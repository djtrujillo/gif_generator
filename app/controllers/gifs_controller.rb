require 'net/http'
require 'json'

class GifsController < ApplicationController
  def new
  end

  def create
    url = "http://api.giphy.com/v1/gifs/search?q=#{params[:search_gif]}&api_key=API_KEY&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    link = result["data"][0]["images"]["fixed_width"]["url"]
    @gif = Gif.create(name: params[:search_gif], image_path: link)
    redirect_to gif_path(@gif)
  end

  def index
    @gifs = Gif.all
  end

  def show
    @gif = Gif.find(params[:id])

  end

end
