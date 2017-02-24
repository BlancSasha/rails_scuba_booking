class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.date = Date.strptime(booking_params[:date], '%m/%d/%Y')
    @booking.user = current_user
    if @booking.save
      redirect_to user_bookings_path, notice: "Your booking has been successfully created"
    else
      @modal_open = true
      redirect_to dive_path(@booking.dive), alert: "It didn't work"
      # render 'dives/show', alert: "It didn't work"
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to user_bookings_path(current_user), notice: "Your booking has been successfully modified"
    else
      render user_bookings_path(current_user), alert: "Your edit didn't work"
    end
  end

  # def create
  #     # [...]
  #     if @review.save
  #       respond_to do |format|
  #         format.html { redirect_to restaurant_path(@restaurant) }
  #         format.js  # <-- will render `app/views/reviews/create.js.erb`
  #       end
  #     else
  #       respond_to do |format|
  #         format.html { render 'restaurants/show' }
  #         format.js  # <-- idem
  #       end
  #     end
  #   end

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
      .permit(:quantity, :dive_id, :review, :rating, :status, :date)

    # rating ? & review ?
    # Pas pour la création et la modification
    # avant qu'ils aient fait leur plongée
  end
end
