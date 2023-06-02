class FlatsController < ApplicationController

  def index
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {flat: flat})
      }
    end

    if params[:query].present?
      @flats = @flats.where("city ILIKE ?", "%#{params[:query]}%")
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
    if @flat.user == current_user
      @flat.destroy
      redirect_to flats_path(@flat), notice: "Flat was successfully removed."
    else
      redirect_to flats_path, alert: "Vous n'êtes pas autorisé à supprimer cet appartement."
    end
  end


  private

  def flat_params
    params.require(:flat).permit(:address, :description, :price_per_day, :guests_allowed, :photo, :city)
  end

end
