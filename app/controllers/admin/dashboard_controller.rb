class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with name: "Jungle", password: "book"

  before_action :authorize

  def show
    # @products = Product.order(id: :desc).all
    @num_of_products = Product.count
    @num_of_categories = Category.count
  end
end
