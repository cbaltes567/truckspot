class Api::V1::VehiclesController < Api::V1::GraphitiController
  def index
    vehicles = VehicleResource.all(params)
    respond_with(vehicles)
  end

  def show
    vehicle = VehicleResource.find(params)
    respond_with(vehicle)
  end

  def create
    vehicle = VehicleResource.build(params)

    if vehicle.save
      render jsonapi: vehicle, status: 201
    else
      render jsonapi_errors: vehicle
    end
  end

  def update
    vehicle = VehicleResource.find(params)

    if vehicle.update_attributes
      render jsonapi: vehicle
    else
      render jsonapi_errors: vehicle
    end
  end

  def destroy
    vehicle = VehicleResource.find(params)

    if vehicle.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: vehicle
    end
  end
end
