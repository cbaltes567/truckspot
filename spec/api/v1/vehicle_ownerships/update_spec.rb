require "rails_helper"

RSpec.describe "vehicle_ownerships#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/vehicle_ownerships/#{vehicle_ownership.id}", payload
  end

  describe "basic update" do
    let!(:vehicle_ownership) { create(:vehicle_ownership) }

    let(:payload) do
      {
        data: {
          id: vehicle_ownership.id.to_s,
          type: "vehicle_ownerships",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(VehicleOwnershipResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { vehicle_ownership.reload.attributes }
    end
  end
end
