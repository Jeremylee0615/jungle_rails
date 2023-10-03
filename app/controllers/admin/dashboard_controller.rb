class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  
  def show

    @product_count = Product.all.count
    @Evergreens_count = Product.where(category_id: 1).count
    @Shrubs_count = Product.where(category_id: 2).count
    @Trees_count = Product.where(category_id: 3).count
    
  end
end
