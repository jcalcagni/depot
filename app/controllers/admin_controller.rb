class AdminController < ApplicationController
  def index
    #@total_orders = Order.count
	#@products = Product.order(:title)
    #@cart = current_cart
	redirect_to store_url
  end
end
