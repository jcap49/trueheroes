class PledgesController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :index, :destroy]

  def index
    @pledges = current_user.pledges
    @users = User.all
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
    if user_signed_in?
      @pledge = current_user.pledges.build(params[:pledge])
      if @pledge.save
        redirect_to @pledge, notice: 'pledge was successfully created.'
      else
        render new_pledge_path
      end
    else
      @pledge = Pledge.new(params[:pledge])
      @pledge.user_id = -1

      if @pledge.save
        session[:pledge_id] = @pledge.id
        redirect_to new_user_session_path
      else
        render new_pledge_path
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
