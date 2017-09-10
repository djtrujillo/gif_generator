require 'net/http'
require 'json'

class Admin::GifsController < Admin::BaseController


  def new
  end

  def create
    url = "http://api.giphy.com/v1/gifs/search?q=#{params[:search_gif]}&api_key=0bd9e7f2810e4acfad5b5992cdeeab52&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)

    link = result["data"][0]["images"]["fixed_width"]["url"]

    @category = Category.create(name: params[:search_gif])
    @gif = Gif.create(image_path: link, category_id: @category.id)
    redirect_to gif_path(@gif)

  end


end
