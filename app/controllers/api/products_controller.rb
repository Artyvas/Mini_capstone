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
    @product = Product.find_by(id: params[:id])
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
    
    # if @product.save
    #   render "show.json.jb"
    # else
    #   render json { message: "Error! Product failed to save"}
    # end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.brand = params[:brand] || @product.brand
    @product.size = params[:size] || @product.size
    @product.price = params[:price] || @product.price
    @product.category = params[:category] || @product.category
    @product.quantity = params[:quantity] || @product.quantity
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    
    @product.save

    # if @product.save
    # render "show.json.jb"
    # else
    #   render json { message: "Error! Failed to update!"}
    # end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product successfully deleted" }
  end
end
