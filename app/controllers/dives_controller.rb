class DivesController < ApplicationController
  def index
    @dives = Dive.all
  end

  def show
    @dive = Dive.find(params[:id])
  end

  def new
    @dive = Dive.new
  end

  def create
    @dive = Dive.new(dive_params)
    if @dive.save
      redirect_to dive_path(@dive)
    end
  end

  def edit
    @dive = Dive.find(params[:id])
  end

  def update
    @dive = Dive.find(params[:id])
    @dive.update(dive_params)
  end

  def destroy
    @dive = Dive.find(params[:id])
    @dive.destroy
  end

  def dive_params
    params.require(:dive).permit(:location, :capacity, :price, :depth_required, :description)
  end
end
