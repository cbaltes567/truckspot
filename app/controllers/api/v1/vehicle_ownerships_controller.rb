class Api::V1::VehicleOwnershipsController < Api::V1::GraphitiController
  def index
    vehicle_ownerships = VehicleOwnershipResource.all(params)
    respond_with(vehicle_ownerships)
  end

  def show
    vehicle_ownership = VehicleOwnershipResource.find(params)
    respond_with(vehicle_ownership)
  end

  def create
    vehicle_ownership = VehicleOwnershipResource.build(params)

    if vehicle_ownership.save
      render jsonapi: vehicle_ownership, status: :created
    else
      render jsonapi_errors: vehicle_ownership
    end
  end

  def update
    vehicle_ownership = VehicleOwnershipResource.find(params)

    if vehicle_ownership.update_attributes
      render jsonapi: vehicle_ownership
    else
      render jsonapi_errors: vehicle_ownership
    end
  end

  def destroy
    vehicle_ownership = VehicleOwnershipResource.find(params)

    if vehicle_ownership.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: vehicle_ownership
    end
  end
end
