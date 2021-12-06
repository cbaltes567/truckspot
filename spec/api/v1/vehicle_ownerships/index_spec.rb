require "rails_helper"

RSpec.describe "vehicle_ownerships#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/vehicle_ownerships", params: params
  end

  describe "basic fetch" do
    let!(:vehicle_ownership1) { create(:vehicle_ownership) }
    let!(:vehicle_ownership2) { create(:vehicle_ownership) }

    it "works" do
      expect(VehicleOwnershipResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["vehicle_ownerships"])
      expect(d.map(&:id)).to match_array([vehicle_ownership1.id,
                                          vehicle_ownership2.id])
    end
  end
end
