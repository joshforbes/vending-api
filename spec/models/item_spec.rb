require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      expect(build(:item)).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cost) }
    it { should validate_numericality_of(:cost).only_integer.is_greater_than(0) }
  end

  describe ".one_of_each" do
    it "returns only entries with distinct names and costs" do
      create(:item, name: "Snickers", cost: 10)
      create(:item, name: "Snickers", cost: 10)
      create(:item, name: "Milky Way")

      result = described_class.one_of_each

      expect(result.to_a.count).to eq(2)
    end
  end
end
