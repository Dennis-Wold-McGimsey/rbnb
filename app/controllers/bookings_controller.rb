# class BookingsController < ApplicationController



#   def my_bookings
#     @bookings = Booking.where(user_id: current_user.id)
#   end

#   def new
#     @booking = Booking.new # Needed to instantiate the form_with
#   end

#   def create
#     @booking = Booking.new(flat_params)
#     @booking.user = current_user

#     if @booking.save
#       redirect_to @flat, notice: "Booking was successfully created."
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @booking = Booking.find(params[:id])
#     @booking.destroy
#     redirect_to flats_path(@flat), notice: "Booking was successfully cancelled."
#   end

#   private

#   def flat_params
#     params.require(:flat).permit(:address, :description, :price_per_day, :guests_allowed)
#   end

# end
