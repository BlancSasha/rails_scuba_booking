class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :create, :destroy]

  def index
    @bookings = Booking.all
  end

  # def show
  # end

  # def new
  #   @booking = Booking.new
  # end

  def create
    @booking = booking.new(booking_params)
    if @booking.save
      redirect_to user_bookings_path(@user)
    else
      @modal_open = true
      render dive_path(@booking.dive)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @booking.destroy
    redirect_to @user.bookings, notice: 'Booking was successfully canceled.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:quantity, :dive, :user, :status)
    # rating ? & review ?
  end
end
