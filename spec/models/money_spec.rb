require 'rails_helper'

RSpec.describe Money, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      expect(build(:quarter)).to be_valid
    end

    it { should validate_presence_of(:type) }
  end

  describe ".pending" do
    it "returns all pending money" do
      pending_money = create(:quarter, :pending)
      not_pending_money = create(:quarter, :not_pending)

      result = described_class.pending

      expect(result).to include(pending_money)
      expect(result).not_to include(not_pending_money)
    end
  end

  describe ".pending_balance" do
    it "returns the sum of the pending money" do
      create(:quarter, :pending)
      create(:quarter, :pending)
      create(:quarter, :not_pending)

      result = described_class.pending_balance

      expect(result).to eq(50)
    end
  end
end
