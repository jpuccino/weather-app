require 'rails_helper'

RSpec.describe "weather_searches/new", type: :view do
  before(:each) do
    assign(:weather_search, WeatherSearch.new(
      city: "MyString",
      state: "MyString",
      country: "MyString",
      zip: 1
    ))
  end

  it "renders new weather_search form" do
    render

    assert_select "form[action=?][method=?]", weather_searches_path, "post" do

      assert_select "input[name=?]", "weather_search[city]"

      assert_select "input[name=?]", "weather_search[state]"

      assert_select "input[name=?]", "weather_search[country]"

      assert_select "input[name=?]", "weather_search[zip]"
    end
  end
end
