require "rails_helper"

RSpec.describe Review, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:garage) }

    it { should belong_to(:reviewer) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:rating) }

    it {
      should validate_numericality_of(:rating).is_greater_than(0).is_less_than(5)
    }

    it { should validate_presence_of(:review_body) }
  end
end
