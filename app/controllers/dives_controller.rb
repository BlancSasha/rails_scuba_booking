class DivesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index

      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    @dives = Dive.all

    filter = nil
    filter = @dives.find_by_location(params[:location]) \
      if params[:location] != nil && params[:location] != ""
    @dives = filter if filter != nil

    filter = nil
    filter = @dives.where("capacity >= ?", params[:capacity]) \
      if params[:capacity] != nil && params[:capacity] != ""
    @dives = filter if filter != nil

    filter = nil
    filter = @dives.where("price <= ?", params[:price]) \
      if params[:price] != nil && params[:price] != ""
    @dives = filter if filter != nil

    filter = nil
    filter = @dives.where("depth_required <= ?", params[:max_depth]) \
      if params[:max_depth] != nil && params[:max_depth] != ""
    @dives = filter if filter != nil

    @dives = @dives.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@dives) do |dive, marker|
      marker.lat dive.latitude
      marker.lng dive.longitude
    end
  end

  def show
    @dive = Dive.find(params[:id])
    @booking = Booking.new
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

