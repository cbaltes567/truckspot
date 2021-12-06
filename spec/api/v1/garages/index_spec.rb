require "rails_helper"

RSpec.describe "garages#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/garages", params: params
  end

  describe "basic fetch" do
    let!(:garage1) { create(:garage) }
    let!(:garage2) { create(:garage) }

    it "works" do
      expect(GarageResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["garages"])
      expect(d.map(&:id)).to match_array([garage1.id, garage2.id])
    end
  end
end
