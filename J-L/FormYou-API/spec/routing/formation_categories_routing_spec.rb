require "rails_helper"

RSpec.describe FormationCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/formation_categories").to route_to("formation_categories#index")
    end

    it "routes to #show" do
      expect(get: "/formation_categories/1").to route_to("formation_categories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/formation_categories").to route_to("formation_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/formation_categories/1").to route_to("formation_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/formation_categories/1").to route_to("formation_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/formation_categories/1").to route_to("formation_categories#destroy", id: "1")
    end
  end
end
