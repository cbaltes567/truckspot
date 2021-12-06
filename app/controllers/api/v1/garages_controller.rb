class Api::V1::GaragesController < Api::V1::GraphitiController
  def index
    garages = GarageResource.all(params)
    respond_with(garages)
  end

  def show
    garage = GarageResource.find(params)
    respond_with(garage)
  end

  def create
    garage = GarageResource.build(params)

    if garage.save
      render jsonapi: garage, status: 201
    else
      render jsonapi_errors: garage
    end
  end

  def update
    garage = GarageResource.find(params)

    if garage.update_attributes
      render jsonapi: garage
    else
      render jsonapi_errors: garage
    end
  end

  def destroy
    garage = GarageResource.find(params)

    if garage.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: garage
    end
  end
end
