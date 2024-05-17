require 'rails_helper'

RSpec.describe "weather_searches/show", type: :view do
  before(:each) do
    assign(:weather_search, WeatherSearch.create!(
      city: "City",
      state: "State",
      country: "Country",
      zip: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/2/)
  end
end
