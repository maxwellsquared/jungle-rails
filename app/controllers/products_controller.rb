class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    puts "-----FROM CONTROLLER-----"
    puts @products.inspect
  end

  def show
    @product = Product.find params[:id]
  end

end
