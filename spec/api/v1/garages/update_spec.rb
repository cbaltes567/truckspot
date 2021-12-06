require 'rails_helper'

RSpec.describe "garages#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/garages/#{garage.id}", payload
  end

  describe 'basic update' do
    let!(:garage) { create(:garage) }

    let(:payload) do
      {
        data: {
          id: garage.id.to_s,
          type: 'garages',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GarageResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { garage.reload.attributes }
    end
  end
end
