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
    # redirect_to profile_dives_path
    ## Rediriger vers la index de Dives namespacé dans #profile
  end

  protected

  def dive_params
    params.require(:dive).permit(:location, :capacity, :price, :depth_required, :description)
  end

  def dive_params
    params.require(:dive).permit(:capacity, :price, :depth_required, :description, photos: [])
  end
end

