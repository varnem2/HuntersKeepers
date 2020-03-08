require "rails_helper"

RSpec.describe FatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/fates").to route_to("fates#index")
    end

    it "routes to #new" do
      expect(:get => "/fates/new").to route_to("fates#new")
    end

    it "routes to #show" do
      expect(:get => "/fates/1").to route_to("fates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fates/1/edit").to route_to("fates#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/fates").to route_to("fates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fates/1").to route_to("fates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fates/1").to route_to("fates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fates/1").to route_to("fates#destroy", :id => "1")
    end
  end
end
