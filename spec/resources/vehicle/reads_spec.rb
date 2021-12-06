require 'rails_helper'

RSpec.describe VehicleResource, type: :resource do
  describe 'serialization' do
    let!(:vehicle) { create(:vehicle) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(vehicle.id)
      expect(data.jsonapi_type).to eq('vehicles')
    end
  end

  describe 'filtering' do
    let!(:vehicle1) { create(:vehicle) }
    let!(:vehicle2) { create(:vehicle) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: vehicle2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([vehicle2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:vehicle1) { create(:vehicle) }
      let!(:vehicle2) { create(:vehicle) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            vehicle1.id,
            vehicle2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            vehicle2.id,
            vehicle1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
