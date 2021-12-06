require 'rails_helper'

RSpec.describe "vehicles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/vehicles/#{vehicle.id}", payload
  end

  describe 'basic update' do
    let!(:vehicle) { create(:vehicle) }

    let(:payload) do
      {
        data: {
          id: vehicle.id.to_s,
          type: 'vehicles',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(VehicleResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { vehicle.reload.attributes }
    end
  end
end
