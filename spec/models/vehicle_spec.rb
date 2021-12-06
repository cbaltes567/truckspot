require "rails_helper"

RSpec.describe Vehicle, type: :model do
  describe "Direct Associations" do
    it { should have_many(:users) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:height) }

    it { should validate_numericality_of(:height).is_greater_than(0) }

    it { should validate_presence_of(:width) }

    it { should validate_numericality_of(:width).is_greater_than(0) }
  end
end
