class FlatsController < ApplicationController

  def index
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def my_flats
    @flats = Flat.where(user_id: current_user.id)
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new # Needed to instantiate the form_with
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user

    if @flat.save
      redirect_to @flat, notice: "Flat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path(@flat), notice: "Flat was successfully removed."
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :description, :price_per_day, :guests_allowed)
  end

end
