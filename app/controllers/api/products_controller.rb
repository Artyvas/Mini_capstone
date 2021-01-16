class Api::ProductsController < ApplicationController
  def product_method
    @message = "Hello!"
    render "products.json.jb"
  end

  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      id: params[:id],
      name: params[:name],
      brand: params[:brand],
      size: params[:size],
      price: params[:price],
      category: params[:category],
      quantity: params[:quantity],
      image_url: params[:image_url],
      description: params[:description],
    )
    @product.save
    render "show.json.jb"
  end
end
