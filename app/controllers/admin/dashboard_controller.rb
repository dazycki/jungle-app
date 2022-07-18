class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @products_summary = Product.all.size
    @categories_summary = Category.all.size 
  end
end
