require "spec_helper"

describe LessonLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/lesson_links").should route_to("lesson_links#index")
    end

    it "routes to #new" do
      get("/lesson_links/new").should route_to("lesson_links#new")
    end

    it "routes to #show" do
      get("/lesson_links/1").should route_to("lesson_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lesson_links/1/edit").should route_to("lesson_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lesson_links").should route_to("lesson_links#create")
    end

    it "routes to #update" do
      put("/lesson_links/1").should route_to("lesson_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lesson_links/1").should route_to("lesson_links#destroy", :id => "1")
    end

  end
end
