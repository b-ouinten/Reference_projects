require "rails_helper"

RSpec.describe FormationAttendancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/formation_attendances").to route_to("formation_attendances#index")
    end

    it "routes to #show" do
      expect(get: "/formation_attendances/1").to route_to("formation_attendances#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/formation_attendances").to route_to("formation_attendances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/formation_attendances/1").to route_to("formation_attendances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/formation_attendances/1").to route_to("formation_attendances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/formation_attendances/1").to route_to("formation_attendances#destroy", id: "1")
    end
  end
end
