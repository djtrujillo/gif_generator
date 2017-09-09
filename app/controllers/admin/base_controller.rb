class Admin::BaseController < ApplicationController
  before_action :require_admin, only: [:new, :create, :show]

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
