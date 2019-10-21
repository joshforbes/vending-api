require "rails_helper"

describe "Purchase Item Mutation API", :graphql do
  describe "purchaseItem" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: PurchaseItemInput!) {
          purchaseItem(input: $input) {
            item {
              id
            }
            change
          }
        }
      GRAPHQL
    end

    it "uses pending money to purchase an item and return the change" do
      item = create(:item, cost: 25)
      create_list(:dime, 3, :pending)
      create(:nickel)

      result = execute query, variables: {
        input: {
          itemId: item.id,
        },
      }

      result_data = result[:data][:purchaseItem]
      expect(result_data[:item][:id]).to eq(item.id.to_s)
      expect(result_data[:change]).to eq(["NICKEL"])
      expect(Item.find_by(id: item.id)).to be_nil
    end
  end
end
