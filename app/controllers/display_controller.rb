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
  
end
