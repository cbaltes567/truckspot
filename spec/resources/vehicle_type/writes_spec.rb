require "rails_helper"

RSpec.describe VehicleTypeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "vehicle_types",
          attributes: {},
        },
      }
    end

    let(:instance) do
      VehicleTypeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { VehicleType.count }.by(1)
    end
  end

  describe "updating" do
    let!(:vehicle_type) { create(:vehicle_type) }

    let(:payload) do
      {
        data: {
          id: vehicle_type.id.to_s,
          type: "vehicle_types",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      VehicleTypeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { vehicle_type.reload.updated_at }
      # .and change { vehicle_type.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:vehicle_type) { create(:vehicle_type) }

    let(:instance) do
      VehicleTypeResource.find(id: vehicle_type.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { VehicleType.count }.by(-1)
    end
  end
end
