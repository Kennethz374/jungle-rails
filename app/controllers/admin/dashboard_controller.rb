class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']

  # before_filter :authorize
  def show
    @product = Product.all.count
    @category = Category.all.count
  end
end
