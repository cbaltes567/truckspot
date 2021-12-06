require "rails_helper"

RSpec.describe "vehicles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/vehicles/#{vehicle.id}", params: params
  end

  describe "basic fetch" do
    let!(:vehicle) { create(:vehicle) }

    it "works" do
      expect(VehicleResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("vehicles")
      expect(d.id).to eq(vehicle.id)
    end
  end
end
