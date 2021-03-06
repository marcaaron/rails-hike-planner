class TrailsController < ApplicationController

  http_basic_authenticate_with name: "user", password: "password", except: [:index, :show]

  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
    @trail = Trail.new
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      redirect_to @trail
    else
      render 'new'
    end
  end

  def update
    @trail = Trail.find(params[:id])

    if @trail.update(trail_params)
      redirect_to @trail
    else
      render 'edit'
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    @trail.destroy

    redirect_to trails_path
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
