require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      expect(build(:item)).to be_valid
    end

    it { should validate_presence_of(:name) }
  end
end
