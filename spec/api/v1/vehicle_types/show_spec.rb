require "rails_helper"

RSpec.describe "vehicle_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/vehicle_types/#{vehicle_type.id}", params: params
  end

  describe "basic fetch" do
    let!(:vehicle_type) { create(:vehicle_type) }

    it "works" do
      expect(VehicleTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("vehicle_types")
      expect(d.id).to eq(vehicle_type.id)
    end
  end
end
