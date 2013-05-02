class StaticPagesController < ApplicationController
  def home
    @pledge = Pledge.new(params[:pledge])
  end

  def why
  end
end
