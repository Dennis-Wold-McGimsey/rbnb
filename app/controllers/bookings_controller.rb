class BookingsController < ApplicationController

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new # Needed to instantiate the form_with
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat

    if @booking.save
      redirect_to my_bookings_path, notice: "Booking was successful! Enjoy your flat."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to flats_path(@flat), notice: "Booking was successfully cancelled."
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
