class PledgesController < ApplicationController

  def index
    @pledges = Pledge.all

    respond_to do |format|
      format.html
      format.json { render json: @pledges }
    end
  end

  def show
    @pledge = Pledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pledge }
    end
  end

  def new
    @pledge = Pledge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pledge }
    end
  end

  def edit
    @pledge = Pledge.find(params[:id])
  end

  def create
    @pledge = Pledge.new(params[:pledge])

    respond_to do |format|
      if @pledge.save
        format.html { redirect_to @pledge, notice: 'Pledge was successfully created.' }
        format.json { render json: @pledge, status: :created, location: @pledge }
      else
        format.html { render action: "new" }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pledge = Pledge.find(params[:id])

    respond_to do |format|
      if @pledge.update_attributes(params[:pledge])
        format.html { redirect_to @pledge, notice: 'Pledge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy

    respond_to do |format|
      format.html { redirect_to pledges_url }
      format.json { head :no_content }
    end
  end
end
