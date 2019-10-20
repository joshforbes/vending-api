require "rails_helper"

describe "Create Item Mutation API", :graphql do
  describe "createItem" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: CreateItemInput!) {
          createItem(input: $input) {
            item {
              name
            }
          }
        }
      GRAPHQL
    end

    it "makes a new item" do
      result = execute query, variables: {
        input: {
          name: "Snickers",
        },
      }

      item_result = result[:data][:createItem][:item]
      expect(item_result[:name]).to eq("Snickers")
      expect(Item.first.name).to eq("Snickers")
    end
  end
end
