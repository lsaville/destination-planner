class WeatherService
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def ten_day_forecast
    response = Faraday.get("http://api.wunderground.com/api/#{ENV["weather_api_key"]}/forecast10day/q/#{zipcode}.json")
    JSON.parse(response.body, symbolize_names: true)[:forecast][:simpleforecast][:forecastday]
  end

  private 
    attr_reader :zipcode
end
