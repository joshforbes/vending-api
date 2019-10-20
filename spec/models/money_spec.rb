require 'rails_helper'

RSpec.describe Money, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      expect(build(:quarter)).to be_valid
    end

    it { should validate_presence_of(:type) }
  end
end
