class Admin::CategoriesController < ApplicationController
  before_action :basic_authenticate
  
  def index
  @categories= Category.all 
end

def new
  @category = Category.new
end

def create
  @category = Category.new(category_params)

  if @category.save
    redirect_to [:admin, :categories], notice: 'Category created!'
  else
    render :new
  end
end

private

def basic_authenticate
  authenticate_or_request_with_http_basic do |username, password|
    username == ENV["HTTP_BASIC_USER"] && password == ENV["HTTP_BASIC_PASSWORD"]
  end
end

def category_params
  params.require(:category).permit(
    :name
  )
end

end
