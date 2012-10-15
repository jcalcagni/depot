class StoreController < ApplicationController
#  skip_before_filter :authorize
  def index
    @products = Product.order(:title)
    @cart = current_cart
  end

 
 #for translation - if locale chosen
 #if params[:set_locale]
 #      redirect_to store_path(locale: params[:set_locale])

 
end
