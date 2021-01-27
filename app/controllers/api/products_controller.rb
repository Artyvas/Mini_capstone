class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def product_method
    @message = "Hello!"
    render "products.json.jb"
  end

  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("name ILIKE?", "%#{params[:search]}%")
    end

    if params[:discount] == "true"
      @products = @products.where("price < ?", 10)
    end

    if params[:sort] == "price" && params[:sort_order] == "asc"
      @products = @products.order(price: :asc)
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.order(price: :desc)
    else
      @products = @products.order(id: :asc)
    end

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
    # @product.save

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
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

    # @product.save

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product successfully deleted" }
  end
end
