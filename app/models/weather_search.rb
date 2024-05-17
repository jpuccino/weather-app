class WeatherSearch < ApplicationRecord
  validate :by_city_and_state, unless: :zip?
  validates :country, presence: true
  validate :zip, if: :no_city_and_state?

  def no_city_and_state?
    city.blank? || state.blank?
  end
end
