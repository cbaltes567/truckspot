require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:vehicle) }

    it { should have_many(:favorites) }

    it { should have_many(:reviews) }

    it { should have_many(:reservations) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:license_plate_number) }

    it { should validate_presence_of(:location) }

    end
end
