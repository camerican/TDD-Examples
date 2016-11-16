require "rails_helper"

RSpec.describe DogsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dogs").to route_to("dogs#index")
    end

    it "routes to #new" do
      expect(:get => "/dogs/new").to route_to("dogs#new")
    end

    it "routes to #show" do
      expect(:get => "/dogs/1").to route_to("dogs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dogs/1/edit").to route_to("dogs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dogs").to route_to("dogs#create")
    end

    it "routes to #update" do
      expect(:put => "/dogs/1").to route_to("dogs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dogs/1").to route_to("dogs#destroy", :id => "1")
    end

  end
end
