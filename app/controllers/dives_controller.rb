class DivesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index

      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    @dives = Dive.all

    filter = nil
    filter = Dive.near(params[:location], 10) \
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
end

