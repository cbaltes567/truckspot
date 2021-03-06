require "rails_helper"

RSpec.describe Reservation, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:garage) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:start_time) }
  end
end
