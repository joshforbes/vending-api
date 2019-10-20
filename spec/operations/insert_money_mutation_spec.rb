require "rails_helper"

describe "Insert Money Mutation API", :graphql do
  describe "insertMoney" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: InsertMoneyInput!) {
          insertMoney(input: $input) {
            success
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

      success_result = result[:data][:insertMoney][:success]
      expect(success_result).to eq(true)
      expect(Quarter.count).to eq(1)
    end
  end
end
