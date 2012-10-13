class RegistrationsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.paginate page: params[:page], registration: 'created_at desc',
	  per_page: 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.json
  def new
    @holder = current_holder
	if @holder.reg_lines.empty?
	   redirect_to display_url, notice: "You have not registered for an event."
	   return
	end
          
    @registration = Registration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(params[:registration])
	@registration.add_reg_lines_from_holder(current_holder)

    respond_to do |format|
      if @registration.save
	    Holder.destroy(session[:holder_id])
		session[:holder_id] = nil
		RegistrationNotifier.received(@registration).deliver
        format.html { redirect_to display_url, notice: 'Registration was successful. See you there!' }
        format.json { render json: @registration, status: :created, location: @registration }
      else
	    @holder = current_holder
        format.html { render action: "new" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to registrations_url }
      format.json { head :no_content }
    end
  end
end
