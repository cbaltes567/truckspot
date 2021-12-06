require 'rails_helper'

RSpec.describe GarageResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'garages',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GarageResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Garage.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:garage) { create(:garage) }

    let(:payload) do
      {
        data: {
          id: garage.id.to_s,
          type: 'garages',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GarageResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { garage.reload.updated_at }
      # .and change { garage.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:garage) { create(:garage) }

    let(:instance) do
      GarageResource.find(id: garage.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Garage.count }.by(-1)
    end
  end
end
