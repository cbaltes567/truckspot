require "rails_helper"

RSpec.describe "garages#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/garages", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "garages",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(GarageResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Garage.count }.by(1)
    end
  end
end
