require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:vehicles) }

    it { should have_many(:favorites) }

    it { should have_many(:reviews) }

    it { should have_many(:reservations) }
  end

  describe "InDirect Associations" do
    it { should have_many(:garage_reviews) }

    it { should have_many(:favorite_garages) }
  end

  describe "Validations" do
  end
end
