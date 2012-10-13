class RegistrationController < ApplicationController
  def index
    @events = Event.order(:eventdate)
  end
end
