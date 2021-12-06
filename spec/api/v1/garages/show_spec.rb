require 'rails_helper'

RSpec.describe "garages#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/garages/#{garage.id}", params: params
  end

  describe 'basic fetch' do
    let!(:garage) { create(:garage) }

    it 'works' do
      expect(GarageResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('garages')
      expect(d.id).to eq(garage.id)
    end
  end
end
