class RegLinesController < ApplicationController
skip_before_filter :authorize, only: :create
  # GET /reg_lines
  # GET /reg_lines.json
  def index
    @reg_lines = RegLine.all

	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reg_lines }
    end
  end

  # GET /reg_lines/1
  # GET /reg_lines/1.json
  def show
    @reg_line = RegLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reg_line }
    end
  end

  # GET /reg_lines/new
  # GET /reg_lines/new.json
  def new
    @reg_line = RegLine.new

	
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reg_line }
    end
  end

  # GET /reg_lines/1/edit
  def edit
    @reg_line = RegLine.find(params[:id])
  end

  # POST /reg_lines
  # POST /reg_lines.json
  def create
    @holder = current_holder
    event = Event.find(params[:event_id])
    #@reg_line = @holder.reg_lines.build
	@reg_line = @holder.add_event(event.id)
    @reg_line.event = event

    respond_to do |format|
      if @reg_line.save
        format.html { redirect_to @reg_line.holder }
        #format.js  { @current_item = @reg_line }
        format.json { render json: @reg_line,
          status: :created, location: @reg_line }
      else
        format.html { render action: "new" }
        format.json { render json: @reg_line.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # PUT /reg_lines/1
  # PUT /reg_lines/1.json
  def update
    @reg_line = RegLine.find(params[:id])

    respond_to do |format|
      if @reg_line.update_attributes(params[:reg_line])
        format.html { redirect_to @reg_line, notice: 'Reg line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reg_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reg_lines/1
  # DELETE /reg_lines/1.json
  def destroy
    @reg_line = RegLine.find(params[:id])
    @reg_line.destroy

    respond_to do |format|
      format.html { redirect_to reg_lines_url }
      format.json { head :no_content }
    end
  end
end
