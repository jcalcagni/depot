class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  private

    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def current_holder 
      Holder.find(session[:holder_id])
    rescue ActiveRecord::RecordNotFound
      holder = Holder.create
      session[:holder_id] = holder.id
      holder
    end
	
    # ...

  protected

    def authorize
      unless User.find_by_id(session[:user_id])
         redirect_to login_url, notice: "Please log in"
      end
    end
end

# for internationalization
# set filter
# before_filter :set_i18n_locale_from_params
# under protected
# def set_i18n_locale_from_params
#      if params[:locale]
#        if I18n.available_locales.include?(params[:locale].to_sym)
#          I18n.locale = params[:locale]
#        else
#          flash.now[:notice] = 
#            "#{params[:locale]} translation not available"
#          logger.error flash.now[:notice]
#        end
#      end
#    end
#    def default_url_options
#      { locale: I18n.locale }
#    end
