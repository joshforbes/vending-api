require 'rails_helper'

RSpec.describe PurchaseItem, type: :model do
  describe "#call" do
    it "returns the item and refunds the change on success" do
      item = create(:item, cost: 10)
      pending_quarter = create(:quarter, :pending)
      dime = create(:dime)
      nickel = create(:nickel)

      result = described_class.new(item).call

      expect(result.success?).to be(true)
      expect(result.item).to eq(item)
      expect(result.change).to eq([dime, nickel])
      expect(pending_quarter.reload).not_to be_pending
      expect(Dime.count).to eq(0)
      expect(Nickel.count).to eq(0)
    end

    it "does not allow the purchase if there is not enough pending money" do
      item = create(:item, cost: 35)
      create(:quarter, :pending)
      create(:dime)

      result = described_class.new(item).call

      expect(result.success?).to be(false)
    end

    it "does not allow the purchase if change cannot be made" do
      item = create(:item, cost: 10)
      create(:quarter, :pending)

      result = described_class.new(item).call

      expect(result.success?).to be(false)
    end
  end
end
