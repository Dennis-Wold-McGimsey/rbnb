class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end


  def show
    @flat = Flat.find(params[:id])
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path(@flat.list), notice: "Flat was successfully removed."
  end

end
