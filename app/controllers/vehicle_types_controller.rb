class VehicleTypesController < ApplicationController
  before_action :set_vehicle_type, only: %i[show edit update destroy]

  def index
    @q = VehicleType.ransack(params[:q])
    @vehicle_types = @q.result(distinct: true).includes(:owners).page(params[:page]).per(10)
  end

  def show
    @vehicle_ownership = VehicleOwnership.new
  end

  def new
    @vehicle_type = VehicleType.new
  end

  def edit; end

  def create
    @vehicle_type = VehicleType.new(vehicle_type_params)

    if @vehicle_type.save
      redirect_to @vehicle_type,
                  notice: "Vehicle type was successfully created."
    else
      render :new
    end
  end

  def update
    if @vehicle_type.update(vehicle_type_params)
      redirect_to @vehicle_type,
                  notice: "Vehicle type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @vehicle_type.destroy
    redirect_to vehicle_types_url,
                notice: "Vehicle type was successfully destroyed."
  end

  private

  def set_vehicle_type
    @vehicle_type = VehicleType.find(params[:id])
  end

  def vehicle_type_params
    params.require(:vehicle_type).permit(:make, :model, :width, :height)
  end
end
