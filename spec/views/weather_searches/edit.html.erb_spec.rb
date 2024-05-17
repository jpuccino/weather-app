require 'rails_helper'

RSpec.describe "weather_searches/edit", type: :view do
  let(:weather_search) {
    WeatherSearch.create!(
      city: "MyString",
      state: "MyString",
      country: "MyString",
      zip: 1
    )
  }

  before(:each) do
    assign(:weather_search, weather_search)
  end

  it "renders the edit weather_search form" do
    render

    assert_select "form[action=?][method=?]", weather_search_path(weather_search), "post" do

      assert_select "input[name=?]", "weather_search[city]"

      assert_select "input[name=?]", "weather_search[state]"

      assert_select "input[name=?]", "weather_search[country]"

      assert_select "input[name=?]", "weather_search[zip]"
    end
  end
end
