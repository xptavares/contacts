require "rails_helper"

RSpec.describe "Roots", type: :request do
  let(:user) { create(:user) }

  before(:each) do
    login_as(user, scope: :user)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end
end
