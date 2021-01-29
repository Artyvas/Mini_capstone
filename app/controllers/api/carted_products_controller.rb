class Api::CartedProductsController < ApplicationController
  def create
    @cartedproduct = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )
    if @cartedproduct.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: 422
    end
  end

  def index
    @cartedproducts = CartedProduct.all

    render "index.json.jb"
  end
end
