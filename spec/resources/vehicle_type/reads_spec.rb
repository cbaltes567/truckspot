require "rails_helper"

RSpec.describe VehicleTypeResource, type: :resource do
  describe "serialization" do
    let!(:vehicle_type) { create(:vehicle_type) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(vehicle_type.id)
      expect(data.jsonapi_type).to eq("vehicle_types")
    end
  end

  describe "filtering" do
    let!(:vehicle_type1) { create(:vehicle_type) }
    let!(:vehicle_type2) { create(:vehicle_type) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: vehicle_type2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([vehicle_type2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:vehicle_type1) { create(:vehicle_type) }
      let!(:vehicle_type2) { create(:vehicle_type) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      vehicle_type1.id,
                                      vehicle_type2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      vehicle_type2.id,
                                      vehicle_type1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
