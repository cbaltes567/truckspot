require 'rails_helper'

RSpec.describe GarageResource, type: :resource do
  describe 'serialization' do
    let!(:garage) { create(:garage) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(garage.id)
      expect(data.jsonapi_type).to eq('garages')
    end
  end

  describe 'filtering' do
    let!(:garage1) { create(:garage) }
    let!(:garage2) { create(:garage) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: garage2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([garage2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:garage1) { create(:garage) }
      let!(:garage2) { create(:garage) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            garage1.id,
            garage2.id
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
            garage2.id,
            garage1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
