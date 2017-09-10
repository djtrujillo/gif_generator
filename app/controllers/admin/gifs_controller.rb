require 'net/http'
require 'json'

class Admin::GifsController < Admin::BaseController


  def new
  end

  def create
    @category = Category.new(name: params[:search_gif])
    if @category.save
      url = "http://api.giphy.com/v1/gifs/search?q=#{params[:search_gif]}&api_key=0bd9e7f2810e4acfad5b5992cdeeab52&limit=10"
      resp = Net::HTTP.get_response(URI.parse(url))
      buffer = resp.body
      result = JSON.parse(buffer)
      link = result["data"][0]["images"]["fixed_width"]["url"]
      @gif = Gif.create(image_path: link, category_id: @category.id)
      redirect_to gif_path(@gif)
    else
      @category = Category.where(name: params[:search_gif])[0]
      category_gif_count = Gif.where(category_id: @category.id).count

      url = "http://api.giphy.com/v1/gifs/search?q=#{params[:search_gif]}&api_key=0bd9e7f2810e4acfad5b5992cdeeab52&limit=10"
      resp = Net::HTTP.get_response(URI.parse(url))
      buffer = resp.body
      result = JSON.parse(buffer)
      link = result["data"][category_gif_count]["images"]["fixed_width"]["url"]
      @gif = Gif.create(image_path: link, category_id: @category.id)
      redirect_to gif_path(@gif)
    end


  end


end
