require "rails_helper"

RSpec.describe Api::V0::PagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "api/v0/pages").to route_to("api/v0/pages#index")
    end

    it "routes to #show" do
      expect(:get => "api/v0/pages/1").to route_to("api/v0/pages#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "api/v0/pages").to route_to("api/v0/pages#create")
    end

  end
end
