require "rails_helper"

RSpec.describe "vehicle_ownerships#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/vehicle_ownerships/#{vehicle_ownership.id}"
  end

  describe "basic destroy" do
    let!(:vehicle_ownership) { create(:vehicle_ownership) }

    it "updates the resource" do
      expect(VehicleOwnershipResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { VehicleOwnership.count }.by(-1)
      expect { vehicle_ownership.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
