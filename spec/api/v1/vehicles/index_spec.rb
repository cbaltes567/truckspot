require "rails_helper"

RSpec.describe "vehicles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/vehicles", params: params
  end

  describe "basic fetch" do
    let!(:vehicle1) { create(:vehicle) }
    let!(:vehicle2) { create(:vehicle) }

    it "works" do
      expect(VehicleResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["vehicles"])
      expect(d.map(&:id)).to match_array([vehicle1.id, vehicle2.id])
    end
  end
end
