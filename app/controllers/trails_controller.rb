class TrailsController < ApplicationController

  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
  end

  def create
    @trail = Trail.new(trail_params)
    @trail.save
    redirect_to @trail
  end

  private
    def trail_params
      params.require(:trail)
      .permit(
        :name,
        :description,
        :latitude,
        :longitude,
        :difficulty,
        :direction
      )
    end
end
