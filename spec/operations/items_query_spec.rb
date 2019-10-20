require "rails_helper"

describe "Items Query API", :graphql do
  describe "items" do
    let(:query) do
      <<-'GRAPHQL'
        query {
          items {
            edges {
              node {
                id
              }
            }
          }
        }
      GRAPHQL
    end

    it "returns a list of items" do
      item = create(:item)

      result = execute query

      items_result = result[:data][:items][:edges].pluck(:node)
      expect(items_result).to include(id: item.id.to_s)
    end
  end
end
