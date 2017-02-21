class DivesController < ApplicationController
  def index
    @dives = Dive.where()
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
    else
      render :new
    end
  end

  def edit
    @dive = Dive.find(params[:id])
  end

  def update
    @dive = Dive.find(params[:id])
    if @dive.update(dive_params)
      redirect_to dive_path(@dive)
    else
      render :edit
    end
  end

  def destroy
    @dive = Dive.find(params[:id])
    if @dive.destroy
      redirect_to dive_path(@dive)
    end
  end

  def dive_params
    params.require(:dive).permit(:location, :capacity, :price, :depth_required, :description)
  end
end
