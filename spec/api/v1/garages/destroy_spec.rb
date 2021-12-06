require "rails_helper"

RSpec.describe "garages#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/garages/#{garage.id}"
  end

  describe "basic destroy" do
    let!(:garage) { create(:garage) }

    it "updates the resource" do
      expect(GarageResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Garage.count }.by(-1)
      expect { garage.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
