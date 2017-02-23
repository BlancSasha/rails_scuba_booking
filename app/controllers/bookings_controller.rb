class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = booking.new(booking_params)

    if @booking.save
      redirect_to user_bookings_path
    else
      @modal_open = true
      render dive_path(@booking.dive)
    end
  end

####### Pas fini d'implémenter
  # def edit

  # end

  # def update
  #   @booking.update(booking_params)
  #   if @booking.update(booking_params)
  #     redirect_to user_bookings_path(current_user)
  #   else
  #     render edit_user_booking(@booking)
  #   end
  # end

  #######

  def destroy
    @booking.destroy
    redirect_to user_bookings_path, notice: 'Booking was successfully canceled.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params
      .require(:booking)
      .permit(:quantity, :dive, :user, :status)
    # rating ? & review ?
    # Pas pour la création et la modification
    # avant qu'ils aient fait leur plongée
  end
end
