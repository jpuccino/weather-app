require 'rails_helper'

RSpec.describe "weather_searches/index", type: :view do
  before(:each) do
    assign(:weather_searches, [
      WeatherSearch.create!(
        city: "City",
        state: "State",
        country: "Country",
        zip: 2
      ),
      WeatherSearch.create!(
        city: "City",
        state: "State",
        country: "Country",
        zip: 2
      )
    ])
  end

  it "renders a list of weather_searches" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Country".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
