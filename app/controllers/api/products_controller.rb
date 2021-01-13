class Api::ProductsController < ApplicationController
  def product_method
    @message = "Hello!"
    render "products.json.jb"
  end
end
