class Api::CartedProductsController < ApplicationController
  def create
    @cartedproduct = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    @cartedproduct.save
    render "show.json.jb"
  end

  def index
    @cartedproducts = current_user.carted_products.where(status: "carted")
    render "index.json.jb"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    render json: { status: "Carted product successfully removed!" }
  end
end
