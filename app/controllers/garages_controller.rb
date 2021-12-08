class GaragesController < ApplicationController
  before_action :set_garage, only: %i[show edit update destroy]

  def index
    @q = Garage.ransack(params[:q])
    @garages = @q.result(distinct: true).includes(:reservations, :reviews,
                                                  :favorites, :users, :reviewers).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@garages.where.not(location_latitude: nil)) do |garage, marker|
      marker.lat garage.location_latitude
      marker.lng garage.location_longitude
    end
  end

  def show
    @favorite = Favorite.new
    @review = Review.new
    @reservation = Reservation.new
  end

  def new
    @garage = Garage.new
  end

  def edit; end

  def create
    @garage = Garage.new(garage_params)

    if @garage.save
      redirect_to @garage, notice: "Garage was successfully created."
    else
      render :new
    end
  end

  def update
    if @garage.update(garage_params)
      redirect_to @garage, notice: "Garage was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @garage.destroy
    redirect_to garages_url, notice: "Garage was successfully destroyed."
  end

  private

  def set_garage
    @garage = Garage.find(params[:id])
  end

  def garage_params
    params.require(:garage).permit(:garage_name, :maximum_height,
                                   :maximum_width, :cost_per_hour, :garage_picture, :location)
  end
end
