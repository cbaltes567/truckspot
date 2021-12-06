require "rails_helper"

RSpec.describe "vehicle_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/vehicle_types/#{vehicle_type.id}", payload
  end

  describe "basic update" do
    let!(:vehicle_type) { create(:vehicle_type) }

    let(:payload) do
      {
        data: {
          id: vehicle_type.id.to_s,
          type: "vehicle_types",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(VehicleTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { vehicle_type.reload.attributes }
    end
  end
end
