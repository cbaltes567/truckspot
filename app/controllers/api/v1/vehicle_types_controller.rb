class Api::V1::VehicleTypesController < Api::V1::GraphitiController
  def index
    vehicle_types = VehicleTypeResource.all(params)
    respond_with(vehicle_types)
  end

  def show
    vehicle_type = VehicleTypeResource.find(params)
    respond_with(vehicle_type)
  end

  def create
    vehicle_type = VehicleTypeResource.build(params)

    if vehicle_type.save
      render jsonapi: vehicle_type, status: :created
    else
      render jsonapi_errors: vehicle_type
    end
  end

  def update
    vehicle_type = VehicleTypeResource.find(params)

    if vehicle_type.update_attributes
      render jsonapi: vehicle_type
    else
      render jsonapi_errors: vehicle_type
    end
  end

  def destroy
    vehicle_type = VehicleTypeResource.find(params)

    if vehicle_type.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: vehicle_type
    end
  end
end
