require 'rails_helper'

RSpec.describe "ArticleFlows", type: :request do
  describe "GET /article_flows" do
    it "works! (now write some real specs)" do
      get article_flows_index_path
      expect(response).to have_http_status(200)
    end
  end
end
