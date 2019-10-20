require "rails_helper"

describe "Balance Query API", :graphql do
  describe "balance" do
    let(:query) do
      <<-'GRAPHQL'
        query {
          balance
        }
      GRAPHQL
    end

    it "returns the sum of the pending money in the machine" do
      create(:quarter, :pending)
      create(:quarter, :not_pending)

      result = execute query

      expect(result[:data][:balance]).to eq(25)
    end
  end
end
