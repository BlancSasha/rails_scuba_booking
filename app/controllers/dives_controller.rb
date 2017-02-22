class DivesController < ApplicationController
  def index
    @dives = Dive.all

    filter = @dives.find_by_location(params[:location])
    @dives = filter if filter != nil && params[:location] != nil

    filter = @dives.where("capacity >= ?", params[:capacity])
    @dives = filter if filter != nil && params[:capacity] != nil

    filter = @dives.where("price <= ?", params[:price])
    @dives = filter if filter != nil && params[:price] != nil

    filter = @dives.where("depth_required <= ?", params[:max_depth])
    @dives = filter if filter != nil && params[:max_depth] != nil
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
    params
      .require(:dive)
      .permit(
        :location,
        :capacity,
        :price,
        :depth_required,
        :description,
        photos: []
      )
  end
end

