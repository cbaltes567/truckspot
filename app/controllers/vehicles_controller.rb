class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show edit update destroy]

  def index
    @q = Vehicle.ransack(params[:q])
    @vehicles = @q.result(distinct: true).includes(:vehicle_ownerships).page(params[:page]).per(10)
  end

  def show
    @vehicle_ownership = VehicleOwnership.new
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit; end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to @vehicle, notice: "Vehicle was successfully created."
    else
      render :new
    end
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: "Vehicle was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_url, notice: "Vehicle was successfully destroyed."
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :width, :height)
  end
end
