class DisplayController < ApplicationController
  skip_before_filter :authorize
  def index
    @events = Event.order(:title)
    @holder = current_holder
  end
  def show
    @events = Event.order(:title)
    @holder = current_holder
  end
  
#for translation, set in drop down in corner  
#  if params[:set_locale]
#      redirect_to display_path(locale: params[:set_locale])

  
end
