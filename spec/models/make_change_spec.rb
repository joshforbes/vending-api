require "rails_helper"

RSpec.describe MakeChange, type: :model do
  describe "#call" do
    it "makes correct change" do
      result = described_class.new(available_money: [
        build_stubbed(:quarter),
        build_stubbed(:quarter),
        build_stubbed(:dime),
        build_stubbed(:dime),
        build_stubbed(:dime),
        build_stubbed(:nickel),
        build_stubbed(:nickel),
      ], due: 65).call

      expect(result.success?).to be(true)
      expect(result.change).to match([Quarter, Quarter, Dime, Nickel])
    end

    it "returns an empty array if no change is due" do
      result = described_class.new(available_money: [
        build_stubbed(:quarter),
      ], due: 0).call

      expect(result.success?).to be(true)
      expect(result.change).to eq([])
    end

    it "fails if it does not have enough available_money to make change" do
      result = described_class.new(available_money: [
        build_stubbed(:quarter),
      ], due: 65).call

      expect(result.success?).to be(false)
    end

    it "fails if it cannot get the change to add up" do
      result = described_class.new(available_money: [
        build_stubbed(:quarter),
        build_stubbed(:dime),
      ], due: 30).call

      expect(result.success?).to be(false)
    end
  end
end
