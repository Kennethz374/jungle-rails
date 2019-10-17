class Admin::DashboardController < ApplicationController
  before_filter :authorize
  def show
    @product = Product.all.count
    @category = Category.all.count
  end
end
