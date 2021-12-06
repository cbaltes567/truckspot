require "rails_helper"

RSpec.describe "vehicle_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/vehicle_types", params: params
  end

  describe "basic fetch" do
    let!(:vehicle_type1) { create(:vehicle_type) }
    let!(:vehicle_type2) { create(:vehicle_type) }

    it "works" do
      expect(VehicleTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["vehicle_types"])
      expect(d.map(&:id)).to match_array([vehicle_type1.id, vehicle_type2.id])
    end
  end
end
