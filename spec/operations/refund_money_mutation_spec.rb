require "rails_helper"

describe "Refund Money Mutation API", :graphql do
  describe "refundMoney" do
    let(:query) do
      <<~'GRAPHQL'
        mutation {
          refundMoney(input: {}) {
            money
          }
        }
      GRAPHQL
    end

    it "removes all of the pending money from the machine" do
      create_list(:quarter, 2, :pending)

      result = execute query

      refund_result = result[:data][:refundMoney]
      expect(refund_result[:money]).to eq(["QUARTER", "QUARTER"])
      expect(Quarter.count).to eq(0)
    end
  end
end
