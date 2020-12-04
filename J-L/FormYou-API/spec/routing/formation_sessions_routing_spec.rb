require "rails_helper"

RSpec.describe FormationSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/formation_sessions").to route_to("formation_sessions#index")
    end

    it "routes to #show" do
      expect(get: "/formation_sessions/1").to route_to("formation_sessions#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/formation_sessions").to route_to("formation_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/formation_sessions/1").to route_to("formation_sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/formation_sessions/1").to route_to("formation_sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/formation_sessions/1").to route_to("formation_sessions#destroy", id: "1")
    end
  end
end
