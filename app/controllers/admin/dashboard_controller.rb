class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_USERNAME'].to_s, password: ENV['HTTP_AUTH_PASSWORD'].to_s

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
