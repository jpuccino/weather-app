require "rails_helper"

RSpec.describe WeatherSearchesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/weather_searches").to route_to("weather_searches#index")
    end

    it "routes to #new" do
      expect(get: "/weather_searches/new").to route_to("weather_searches#new")
    end

    it "routes to #show" do
      expect(get: "/weather_searches/1").to route_to("weather_searches#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/weather_searches/1/edit").to route_to("weather_searches#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/weather_searches").to route_to("weather_searches#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/weather_searches/1").to route_to("weather_searches#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/weather_searches/1").to route_to("weather_searches#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/weather_searches/1").to route_to("weather_searches#destroy", id: "1")
    end
  end
end
