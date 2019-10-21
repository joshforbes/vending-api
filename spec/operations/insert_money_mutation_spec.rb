require "rails_helper"

describe "Insert Money Mutation API", :graphql do
  describe "insertMoney" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: InsertMoneyInput!) {
          insertMoney(input: $input) {
            money
          }
        }
      GRAPHQL
    end

    it "creates a quarter" do
      result = execute query, variables: {
        input: {
          money: "QUARTER"
        },
      }

      money_result = result[:data][:insertMoney][:money]
      expect(money_result).to eq("QUARTER")
      expect(Quarter.count).to eq(1)
    end
  end
end
