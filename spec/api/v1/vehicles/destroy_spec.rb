require "rails_helper"

RSpec.describe "vehicles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/vehicles/#{vehicle.id}"
  end

  describe "basic destroy" do
    let!(:vehicle) { create(:vehicle) }

    it "updates the resource" do
      expect(VehicleResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Vehicle.count }.by(-1)
      expect { vehicle.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
