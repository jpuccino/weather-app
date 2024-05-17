class OpenWeatherService < ApplicationService
  attr_reader :result
  #private_class_method :new
  def initialize(city: nil, state: nil, country: nil, zip: nil)
    @city = city
    @state = state
    @country = country
    @zip = zip
  end

  def call
    @result = if @zip.present?
                client.current_zip(@zip, @country)
              else
                client.current_weather({city: @city, state: @state, country: @country}.compact)
              end

    @result
  end

  def client
    @client ||= OpenWeather::Client.new
  end

end