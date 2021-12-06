require "rails_helper"

RSpec.describe VehicleOwnershipResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "vehicle_ownerships",
          attributes: {},
        },
      }
    end

    let(:instance) do
      VehicleOwnershipResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { VehicleOwnership.count }.by(1)
    end
  end

  describe "updating" do
    let!(:vehicle_ownership) { create(:vehicle_ownership) }

    let(:payload) do
      {
        data: {
          id: vehicle_ownership.id.to_s,
          type: "vehicle_ownerships",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      VehicleOwnershipResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { vehicle_ownership.reload.updated_at }
      # .and change { vehicle_ownership.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:vehicle_ownership) { create(:vehicle_ownership) }

    let(:instance) do
      VehicleOwnershipResource.find(id: vehicle_ownership.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { VehicleOwnership.count }.by(-1)
    end
  end
end
