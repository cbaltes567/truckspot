require 'rails_helper'

RSpec.describe VehicleResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'vehicles',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VehicleResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Vehicle.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:vehicle) { create(:vehicle) }

    let(:payload) do
      {
        data: {
          id: vehicle.id.to_s,
          type: 'vehicles',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VehicleResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { vehicle.reload.updated_at }
      # .and change { vehicle.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:vehicle) { create(:vehicle) }

    let(:instance) do
      VehicleResource.find(id: vehicle.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Vehicle.count }.by(-1)
    end
  end
end
