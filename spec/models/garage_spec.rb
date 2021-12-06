require 'rails_helper'

RSpec.describe Garage, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_numericality_of(:parking_spot_width).is_greater_than(0) }

    end
end
