class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders

    render "index.json.jb"
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    calculated_subtotal = 0
    tax_rate = 0.09

    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )

    @order.save
    carted_products.update_all(status: "puchased", order_id: @order.id)
    render "show.json.jb"
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render "show.json.jb"
  end
end
