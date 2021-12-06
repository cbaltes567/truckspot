require "rails_helper"

RSpec.describe "vehicle_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/vehicle_types/#{vehicle_type.id}"
  end

  describe "basic destroy" do
    let!(:vehicle_type) { create(:vehicle_type) }

    it "updates the resource" do
      expect(VehicleTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { VehicleType.count }.by(-1)
      expect { vehicle_type.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
