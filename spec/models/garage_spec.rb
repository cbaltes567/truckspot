require 'rails_helper'

RSpec.describe Garage, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reservations) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:cost_per_hour) }

    it { should validate_numericality_of(:cost_per_hour).is_greater_than(0) }

    it { should validate_presence_of(:location) }

    it { should validate_presence_of(:lowest_height) }

    it { should validate_numericality_of(:lowest_height).is_greater_than(0) }

    it { should validate_presence_of(:parking_spot_width) }

    it { should validate_numericality_of(:parking_spot_width).is_greater_than(0) }

    end
end
