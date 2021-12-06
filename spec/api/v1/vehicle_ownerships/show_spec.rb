require "rails_helper"

RSpec.describe "vehicle_ownerships#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/vehicle_ownerships/#{vehicle_ownership.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:vehicle_ownership) { create(:vehicle_ownership) }

    it "works" do
      expect(VehicleOwnershipResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("vehicle_ownerships")
      expect(d.id).to eq(vehicle_ownership.id)
    end
  end
end
