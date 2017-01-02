require 'rails_helper'

describe WeatherService do
  context '#ten_day_forecast' do
    it 'gets the ten day forecast for a zipcode', :vcr do
      ten_day = WeatherService.new(80205).ten_day_forecast
      
      expect(ten_day).to be_an(Array)
      expect(ten_day.first).to have_key(:date)
      expect(ten_day.first).to have_key(:high)
      expect(ten_day.first).to have_key(:low)
      expect(ten_day.first).to have_key(:conditions)

    end
  end
end
