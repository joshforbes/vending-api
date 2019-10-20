require "rails_helper"

RSpec.describe "Graphql API", type: :request do
  describe "POST #execute" do
    context "with no query" do
      it "successfully executes" do
        post graphql_url, params: {query: ""}

        expect(response).to have_http_status(:ok)
        expect(json_response).to be_empty
      end
    end
  end

  def json_response
    ActiveSupport::JSON.decode(@response.body).deep_symbolize_keys
  end
end
