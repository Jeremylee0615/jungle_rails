class Admin::CategoriesController < ApplicationController
  
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'New category has been created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Selected category is now deleted!'
  end

  private
  def category_params
    params.require(:category).permit(:name)
    end
  end