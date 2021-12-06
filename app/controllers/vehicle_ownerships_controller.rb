class VehicleOwnershipsController < ApplicationController
  before_action :set_vehicle_ownership, only: %i[show edit update destroy]

  def index
    @q = VehicleOwnership.ransack(params[:q])
    @vehicle_ownerships = @q.result(distinct: true).includes(:owner,
                                                             :vehicle).page(params[:page]).per(10)
  end

  def show; end

  def new
    @vehicle_ownership = VehicleOwnership.new
  end

  def edit; end

  def create
    @vehicle_ownership = VehicleOwnership.new(vehicle_ownership_params)

    if @vehicle_ownership.save
      message = "VehicleOwnership was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @vehicle_ownership, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @vehicle_ownership.update(vehicle_ownership_params)
      redirect_to @vehicle_ownership,
                  notice: "Vehicle ownership was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @vehicle_ownership.destroy
    message = "VehicleOwnership was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to vehicle_ownerships_url, notice: message
    end
  end

  private

  def set_vehicle_ownership
    @vehicle_ownership = VehicleOwnership.find(params[:id])
  end

  def vehicle_ownership_params
    params.require(:vehicle_ownership).permit(:vehicle_id, :owner_id,
                                              :license_plate_number)
  end
end
