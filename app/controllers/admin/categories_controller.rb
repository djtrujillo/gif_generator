class Admin::CategoriesController < Admin::BaseController

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_gifs_path
  end

  def show
    @category = Category.find(params[:id])
  end




end
