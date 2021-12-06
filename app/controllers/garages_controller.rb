class GaragesController < ApplicationController
  before_action :set_garage, only: %i[show edit update destroy]

  # GET /garages
  def index
    @q = Garage.ransack(params[:q])
    @garages = @q.result(distinct: true).includes(:reservations, :reviews,
                                                  :favorites, :users, :reviewers).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@garages.where.not(location_latitude: nil)) do |garage, marker|
      marker.lat garage.location_latitude
      marker.lng garage.location_longitude
      marker.infowindow "<h5><a href='/garages/#{garage.id}'>#{garage.lowest_height}</a></h5><small>#{garage.location_formatted_address}</small>"
    end
  end

  # GET /garages/1
  def show
    @favorite = Favorite.new
    @review = Review.new
    @reservation = Reservation.new
  end

  # GET /garages/new
  def new
    @garage = Garage.new
  end

  # GET /garages/1/edit
  def edit; end

  # POST /garages
  def create
    @garage = Garage.new(garage_params)

    if @garage.save
      redirect_to @garage, notice: "Garage was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /garages/1
  def update
    if @garage.update(garage_params)
      redirect_to @garage, notice: "Garage was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /garages/1
  def destroy
    @garage.destroy
    redirect_to garages_url, notice: "Garage was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_garage
    @garage = Garage.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def garage_params
    params.require(:garage).permit(:lowest_height, :location, :cost_per_hour,
                                   :parking_spot_width, :garage_picture)
  end
end
