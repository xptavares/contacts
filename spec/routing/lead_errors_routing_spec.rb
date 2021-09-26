require "rails_helper"

RSpec.describe LeadErrorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lead_errors").to route_to("lead_errors#index")
    end

    it "routes to #new" do
      expect(get: "/lead_errors/new").to route_to("lead_errors#new")
    end

    it "routes to #show" do
      expect(get: "/lead_errors/1").to route_to("lead_errors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lead_errors/1/edit").to route_to("lead_errors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lead_errors").to route_to("lead_errors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lead_errors/1").to route_to("lead_errors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lead_errors/1").to route_to("lead_errors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lead_errors/1").to route_to("lead_errors#destroy", id: "1")
    end
  end
end
