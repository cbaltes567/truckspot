require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_numericality_of(:width).is_greater_than(0) }

    end
end
